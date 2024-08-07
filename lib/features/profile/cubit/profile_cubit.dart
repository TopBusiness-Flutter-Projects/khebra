// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/models/user_data_model.dart';
import 'package:khebra/core/remote/service.dart';

import 'package:khebra/core/utils/app_export.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.api) : super(ProfileInitialState());
  ServiceApi api;

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

  File? profileFile;
  Future pickImage(BuildContext context, bool isGallery) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera);

    if (pickedFile != null) {
      profileFile = File(pickedFile.path);
      base64String = await fileToBase64String(pickedFile.path);
      emit(FilePickedSuccessfully());
    } else {
      emit(FileNotPicked());
    }
    Navigator.pop(context);
  }

  GetUserDataModel getUserDataModel = GetUserDataModel();
  getUserData() async {
    emit(LoadingGettingUserDataState());
    final response = await api.getUserData();
    response.fold((l) {
      emit(FailureGettingUserDataState());
    }, (r) {
      if (r.result != null) {
        if (r.result!.isNotEmpty) {
          getUserDataModel = r;
        }
      }
      print('555555555555555 ${r.result![0].name!}');

      emit(SuccessGettingUserDataState());
    });
  }

  Future<String> fileToBase64String(String filePath) async {
    File file = File(filePath);
    Uint8List bytes = await file.readAsBytes();
    String base64String = base64Encode(bytes);
    return base64String;
  }

  String base64String = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  updateProfile(BuildContext context) async {
    emit(LoadingUpdateProfileState());
    print("fffffff $base64String");
    print(base64String);
    final response = await api.updateProfile(
      image: base64String,
      mobile: phoneNumberController.text,
    );
    response.fold((l) {
      errorGetBar("d");
      emit(FailureUpdateProfileState());
    }, (r) async {
      print(r.result);
      if (r.result != null) {
        // Navigator.pushNamedAndRemoveUntil(
        // context, Routes.mainRoute, (route) => false);
//
        emit(SuccessUpdateProfileState());
      } else {
        errorGetBar("حدث خطأ ما");
      }
    });
  }
}
