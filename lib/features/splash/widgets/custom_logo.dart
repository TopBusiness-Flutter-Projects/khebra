import 'package:flutter/material.dart';
import 'package:khebra/core/utils/assets_manager.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logoImage,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 4,
    );
  }
}
