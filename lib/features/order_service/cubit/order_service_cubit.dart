// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khebra/core/models/all_products_model.dart';
import 'package:khebra/core/models/all_provider_model.dart';
import 'package:khebra/core/models/category_model.dart';
import 'package:khebra/core/models/defaul_model.dart';
import 'package:khebra/core/remote/service.dart';
import 'package:khebra/features/order_service/screens/filtered_technicians_screen.dart';

import '../../../core/utils/app_export.dart';
import 'orders_service_states.dart';

class OrderServiceCubit extends Cubit<OrderServiceStates> {
  OrderServiceCubit(this.api) : super(OrderServiceInitialState()) {
    changeSelecttime(timesList.first);
  }
  ServiceApi api;
  String selectedDateFormated = DateFormat('yyyy-MM-dd')
      .format(DateTime.parse(DateTime.now().toString()));
  changeTheDate(String selectedDate) {
    selectedDateFormated =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(selectedDate));

    print("ffffffffffffffff$selectedDate");
    emit(ChangeDateState());
  }

  void showImageSourceDialog(
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'select_image'.tr(),
            style: getMediumStyle(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                pickImage(context, true);
              },
              child: Text(
                'gallery'.tr(),
                style:
                    getRegularStyle(fontSize: 12.sp, color: AppColors.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                pickImage(context, false);
              },
              child: Text(
                "camera".tr(),
                style:
                    getRegularStyle(fontSize: 12.sp, color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  removeImage(File file) {
    uploadedImage.remove(file);
    uploadedImageStrings.remove(file.path);
    emit(FileRemovedSuccessfully());
  }

  List<File> uploadedImage = [];
  List<String> uploadedImageStrings = [];

  // File? profileFile;
  Future pickImage(BuildContext context, bool isGallery) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera);

    if (pickedFile != null) {
      uploadedImage.add(File(pickedFile.path));
      String base64String = await fileToBase64String(pickedFile.path);
      uploadedImageStrings.add(base64String);

      emit(FilePickedSuccessfully());
    } else {
      emit(FileNotPicked());
    }
    Navigator.pop(context);
  }

  Future<String> fileToBase64String(String filePath) async {
    File file = File(filePath);
    Uint8List bytes = await file.readAsBytes();
    String base64String = base64Encode(bytes);
    return base64String;
  }

  String selectedTime = "";
  // String selectedTime = "10:30 am";
  changeSelecttime(String e) {
    selectedTime = e;

    emit(ChangeTimeState());
  }

  String selectedCategoryId = "";
  changeCategoryId(String e) {
    selectedCategoryId = e;
    print("category id $selectedCategoryId");
    getAllProductsByCategory(int.parse(e));
    emit(ChangeTimeState());
  }

  String? selectedServiceId;
  changeServiceId(String e, double price) {
    selectedServiceId = e;
    changeServiceQty(1);
    print("price$price");
    servicePrice = price;
    changeTotalServicePrice();
    print("service id $selectedServiceId");

    emit(ChangeTimeState());
  }

  String? selectedExperience;

  List<String> experienceList = [
    "beginner",
    "intermediate",
    "advanced",
  ];
  changeExperience(String e) {
    selectedExperience = e;

    emit(ChangeTimeState());
  }

  List<String> timesList = [
    "10:00:00",
    "10:50:00",
    "10:60:00",
    "11:00:00",
    "10:02:00",
    "10:30:00",
    "10:20:00",
    "10:05:00",
    "08:00:00",
    "08:00:00",
    "12:00:00"
  ];
//////// APIs /////
  AllCategoriesModel categoriesModel = AllCategoriesModel();
  getAllCategories() async {
    selectedCategoryId = "";
    emit(LoadingGetAllCategoriesState());
    final response = await api.getAllCategories();
    response.fold((l) => emit(FailureGetAllCategoriesState()), (r) {
      emit(SuccessGetAllCategoriesState());
      categoriesModel = r;
    });
  }

  AllProductsModel productsOfCategoryModel = AllProductsModel();
  getAllProductsByCategory(int categoryId) async {
    productsOfCategoryModel = AllProductsModel();
    emit(LoadingProductsOfCategoryInitial());
    final response = await api.getAllProductsByCategory(categoryId: categoryId);
    response.fold((l) {
      emit(ErrorProductsOfCategoryInitial());
    }, (r) {
      if (r.result!.isNotEmpty) {
        changeServiceId(
            r.result!.first.id.toString(), r.result!.first.listPrice!);
        print("object" + servicePrice.toString());
      }
      productsOfCategoryModel = r;
      emit(LoadedProductsOfCategoryInitial());
    });
  }

  int serviceQty = 1;
  double servicePrice = 0;
  double totalServicePrices = 0;
  changeTotalServicePrice() {
    totalServicePrices = serviceQty * servicePrice;
    emit(ChangeTimeState());
  }

  changeServiceQty(int e) {
    serviceQty = e;
    changeTotalServicePrice();
    emit(ChangeTimeState());
  }

  GetAllProviderModel getAllProviderModel = GetAllProviderModel();
  getProviders(BuildContext context) async {
    emit(LoadingGetAllProvidersState());
    if (selectedCategoryId != '' &&
        selectedExperience != null &&
        selectedServiceId != null) {
      final response = await api.getProvidersWithFilters(
          categoryId: selectedCategoryId, level: selectedExperience!);
      response.fold((l) => emit(FailureGetAllProvidersState()), (r) {
        getAllProviderModel = r;

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilteredTechniciansScreen(),
            ));
        emit(SuccessGetAllProvidersState());
      });
    } else {
      errorGetBar("message");
    }
  }

  DefaultModel defaultModel = DefaultModel();
  addService(BuildContext context, {required int providerId}) async {
    print("eeeeeeeeeee $selectedDateFormated");
    emit(LoadingAddServiceState());
    if (selectedCategoryId != '' &&
        selectedExperience != null &&
        selectedServiceId != null) {
      final response = await api.addService(
          categoryId: selectedCategoryId,
          date: "$selectedDateFormated $selectedTime",
          // date: "2024-08-07 07:19:00",
          images: uploadedImageStrings,
          level: selectedExperience!,
          providerId: providerId.toString(),
          qty: serviceQty.toString(),
          serviceId: selectedServiceId!,
          servicePrice: servicePrice.toString(),
          totalPrice: totalServicePrices.toString());
      response.fold((l) => emit(FailureAddServiceState()), (r) {
        defaultModel = r;
        Navigator.pushNamed(context, Routes.mainRoute);
        emit(SuccessAddServiceState());
      });
    } else {
      errorGetBar("من فضلك ادخل جميع البيانات");
    }
  }
}
