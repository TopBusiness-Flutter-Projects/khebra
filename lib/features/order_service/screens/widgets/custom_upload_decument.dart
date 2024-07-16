
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/utils/app_export.dart';

class CustomDocumentWidget extends StatelessWidget {
  const CustomDocumentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.uploadIcon,
          width: 35,
          height: 35,
        ),
        Center(
          child: Text("uploadImage".tr(),
              style: getMediumStyle(fontSize: 14, color: AppColors.greyHint2)),
        )
      ],
    );
  }
}
