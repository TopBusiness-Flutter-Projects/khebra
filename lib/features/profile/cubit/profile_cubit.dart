// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
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

      emit(FilePickedSuccessfully());
    } else {
      emit(FileNotPicked());
    }
    Navigator.pop(context);
  }
}
