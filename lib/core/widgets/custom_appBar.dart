// import 'package:flutter/material.dart';
// import 'package:khebra/core/widgets/custom_points_text.dart';

// import '../utils/app_const.dart';
// import '../utils/custom_svg_icon.dart';
// import '../utils/styles/app_colors.dart';
// import '../utils/styles/app_fonts.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.text,
//     this.withPoints = false,
//     this.onTap,
//   });
//   final String text;
//   final bool? withPoints;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         GestureDetector(
//             onTap: onTap ?? () => Navigator.pop(context),
//             child: AppIcons.arrowBack),
//         const SizedBox(
//           width: AppConstants.sizedBoxWidth,
//         ),
//         Text(
//           text,
//           style: getBoldStyle(color: AppColors.blackText, fontSize: 20),
//         ),
//         Spacer(),
//         if (withPoints!) CustomPointsText()
//       ],
//     );
//   }
// }
