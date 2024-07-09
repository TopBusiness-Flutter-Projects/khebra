import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomOrderButton extends StatelessWidget {
  const CustomOrderButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
    this.path,
    this.borderColor,  this.radius =50,
  });
  final String text;
  final String? path;
  final void Function()? onTap;
  final Color buttonColor;
  final Color? borderColor;
  final Color textColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: BoxDecoration(
              color: buttonColor,
              border: Border.all(color: borderColor ?? buttonColor),
              borderRadius: BorderRadius.circular(radius)),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                path == null
                    ? Container()
                    : Image.asset(
                        path!,
                        width: 23.w,
                        height: 23.w,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    text,
                    style: getRegularStyle(color: textColor),
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
