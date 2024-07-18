import 'package:easy_localization/easy_localization.dart';

import 'package:khebra/core/utils/app_export.dart';

class CustomButtonProjects extends StatelessWidget {
  const CustomButtonProjects(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.color});
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          onPressed!();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text!.tr(),
              style: getRegularStyle(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
