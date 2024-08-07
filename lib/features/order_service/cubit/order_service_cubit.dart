// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khebra/core/remote/service.dart';

import '../../../core/utils/app_export.dart';
import 'orders_service_states.dart';

class OrderServiceCubit extends Cubit<OrderServiceStates> {
  OrderServiceCubit(this.api) : super(OrderServiceInitialState()) {
    changeSelecttime(timesList.first);
  }
  ServiceApi api;
  String selectedDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.parse(DateTime.now().toString()));
  changeTheDate(String selectedDate) {
    selectedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(selectedDate));
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
    emit(FileRemovedSuccessfully());
  }

  List<File> uploadedImage = [];

  // File? profileFile;
  Future pickImage(BuildContext context, bool isGallery) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera);

    if (pickedFile != null) {
      uploadedImage.add(File(pickedFile.path));

      // profileFile = File(pickedFile.path);

      emit(FilePickedSuccessfully());
    } else {
      emit(FileNotPicked());
    }
    Navigator.pop(context);
  }

  String selectedTime = "";
  // String selectedTime = "10:30 am";
  changeSelecttime(String e) {
    selectedTime = e;

    emit(ChangeTimeState());
  }

  List<String> timesList = [
    "10:00 am",
    "10:50 am",
    "10:60 am",
    "11:00 am",
    "10:02 am",
    "10:30 am",
    "10:20 pm",
    "10:05 am",
    "08:00 am",
    "08:00 am",
    "12:00 am"
  ];
//////// APIs


  // AllCategoriesModel? categoriesModel;
  // getAllCategories() async {
  //   emit(LoadingGetAllCategoriesState());
  //   // authModel = await Preferences.instance.getUserModel2();
  //   final response = await api.getAllCategories();
  //   response.fold((l) => emit(FailureGetAllCategoriesState()), (r) {
  //     emit(SuccessGetAllCategoriesState());
  //     categoriesModel = r;
  //   });
  // }



}
