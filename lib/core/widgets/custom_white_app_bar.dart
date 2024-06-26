// import 'package:flutter/material.dart';

// import '../utils/app_const.dart';
// import '../utils/custom_svg_icon.dart';
// import '../utils/styles/app_colors.dart';
// import '../utils/styles/app_fonts.dart';

// class CustomWhiteAppBar extends StatelessWidget {
//   const CustomWhiteAppBar({
//     super.key, required this.text,  this.onTap  ,
//   });
//   final String text;

//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,

//       children: [
//         GestureDetector(
//             onTap:onTap ?? () => Navigator.pop(context),
//             child: AppIcons.backArrowWhite),
//         const SizedBox(width: AppConstants.sizedBoxWidth,),
//         Text(
//           text,
//           style: getBoldStyle(color: AppColors.white, fontSize: 20),
//         ),


//       ],
//     );
//   }
// }
