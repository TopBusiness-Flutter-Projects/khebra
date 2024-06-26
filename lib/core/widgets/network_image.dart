import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';
import '../utils/styles/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.height = 0,
      this.width = 0,
      this.boxFit = BoxFit.cover,
      this.borderRadius = 12,
      this.errorWidget});

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
  final BoxFit? boxFit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        height: height != 0 ? height : null,
        width: width != 0 ? width : null,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Image.asset(
              AppImages.logo2Image,
              fit: boxFit,
              height: height != 0 ? height : null,
              width: width != 0 ? width : null,
            ),
      ),
    );
  }
}
