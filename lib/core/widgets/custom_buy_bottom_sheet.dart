// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:khebra/core/utils/app_const.dart';
// import 'package:khebra/core/utils/app_strings.dart';
// import 'package:khebra/core/utils/styles/app_colors.dart';
// import 'package:khebra/core/utils/styles/app_fonts.dart';
// import 'package:khebra/core/widgets/custom_button.dart';
// import 'package:khebra/core/widgets/custom_space.dart';
// import 'package:khebra/features/home/cubit/home_cubit.dart';

// import '../utils/assets_manager.dart';
// import 'network_image.dart';

// class CustomBuyPointsOrMessagesSheet extends StatelessWidget {
//   const CustomBuyPointsOrMessagesSheet({
//     super.key,
//     this.onPressed,
//     required this.price,
//     required this.count,
//   });

//   final String price;
//   final String count;

//   final void Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         HomeCubit cubit = context.read<HomeCubit>();
//         return ConditionalBuilder(
//           condition: cubit.homeModel != null,
//           fallback: (context) => const CustomSpace(),
//           builder: (context) => Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//               child: SingleChildScrollView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                       alignment: Alignment.center,
//                       child: SvgPicture.asset(
//                         AppImages.greyLine,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Row(children: [
//                       CustomNetworkImage(
//                           height: 60,
//                           width: 60,
//                           imageUrl: cubit.homeModel!.data!.user!.image!),
//                       const SizedBox(width: AppConstants.sizedBoxWidth),
//                       Flexible(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Flexible(
//                                   child: Text(
//                                     count,
//                                     style: getMediumStyle(fontSize: 18),
//                                   ),
//                                 ),
//                                 Text(
//                                   price,
//                                   style: getMediumStyle(fontSize: 18),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               cubit.homeModel!.data!.user!.gmail! ?? '',
//                               style:
//                                   getMediumStyle(color: AppColors.primaryHint),
//                               textAlign: TextAlign.start,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       child: CustomButton(
//                         buttonColor: AppColors.white,
//                         textColor: AppColors.primary,
//                         text: AppStrings.paymentMethod,
//                         onPressed: onPressed,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
