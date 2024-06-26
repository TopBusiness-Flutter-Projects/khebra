import 'package:flutter/material.dart';
import 'package:khebra/core/utils/custom_svg_icon.dart';

import 'styles/app_colors.dart';

class AppWidget {
  static createProgressDialog(BuildContext context, String msg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Text(
                  msg,
                  style: TextStyle(color: AppColors.black, fontSize: 15.0),
                )
              ],
            ),
          );
        });
  }


}
