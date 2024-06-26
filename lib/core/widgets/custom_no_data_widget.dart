// import 'package:flutter/material.dart';
// import 'package:khebra/core/utils/app_strings.dart';
// import 'package:khebra/core/utils/custom_svg_icon.dart';
// import 'package:khebra/core/utils/styles/app_fonts.dart';
// import 'package:khebra/core/widgets/custom_space.dart';

// class CustomNoDataWidget extends StatelessWidget {
//   const CustomNoDataWidget({
//     super.key,
//     required this.child,
//     required this.isEmbty,
//     this.withAppBar,
//     required this.theType,
//   });
//   final Widget child;
//   final Widget? withAppBar;
//   final bool isEmbty;

//   final BodyType theType;

//   @override
//   Widget build(BuildContext context) {
//     return isEmbty
//         ? Column(
//             children: [
//               withAppBar ??
//                   SizedBox(
//                     height: 10,
//                   ),
//               Center(
//                 child: Column(children: [
//                   SizedBox(height: MediaQuery.of(context).size.width / 3),
//                   bodyWidget(theType),
//                   const CustomSpace(),
//                   Text(
//                     bodyText(theType),
//                     style: getMediumStyle(),
//                   )
//                 ]),
//               ),
//             ],
//           )
//         : child;
//   }
// }

// enum BodyType { notification, video, messages, channel, app }

// Widget bodyWidget(BodyType type) {
//   Widget widget;
//   switch (type) {
//     case BodyType.notification:
//       widget = AppSvgImages.noNotification;
//       break;
//     case BodyType.video:
//       widget = AppSvgImages.noVideos;
//       break;
//     case BodyType.messages:
//       widget = AppSvgImages.noMessages;
//       break;
//     case BodyType.channel:
//       widget = AppSvgImages.noVideos;
//       break;
//     case BodyType.app:
//       widget = AppSvgImages.noApps;
//       break;
//   }
//   return widget;
// }

// String bodyText(BodyType type) {
//   String text;
//   switch (type) {
//     case BodyType.notification:
//       text = AppStrings.noNotification;
//       break;
//     case BodyType.video:
//       text = AppStrings.noVideos;
//       break;
//     case BodyType.messages:
//       text = AppStrings.noMessages;
//       break;
//     case BodyType.channel:
//       text = AppStrings.noChannels;
//       break;
//     case BodyType.app:
//       text = AppStrings.noDownloads;
//       break;
//   }
//   return text;
// }
