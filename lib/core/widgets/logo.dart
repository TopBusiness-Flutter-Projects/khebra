import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';


class LogoImage extends StatelessWidget {

  final double? width;
  final double? height;
  const LogoImage({
    Key? key,

    this.width = 170,
    this.height = 170,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: width,
      height: height,
      AppImages.logoImage,
      fit: BoxFit.cover,
    );
  }
}
