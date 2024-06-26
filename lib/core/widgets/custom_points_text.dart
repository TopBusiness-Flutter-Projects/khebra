// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../features/home/cubit/home_cubit.dart';
// import '../utils/app_strings.dart';
// import '../utils/styles/app_colors.dart';
// import '../utils/styles/app_fonts.dart';

// class CustomPointsText extends StatelessWidget {
//   const CustomPointsText({
//     super.key,

//   });



//   @override
//   Widget build(BuildContext context) {
//     HomeCubit cubit = context.read<HomeCubit>();
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         return ConditionalBuilder(
//           fallback:(context) => Container(child: null),

//           condition:cubit.homeModel.data != null,
//           builder: (context) =>  Text(
//             '${cubit.homeModel.data!.user!.points} ${AppStrings.point}',
//             style: getBoldStyle(
//                 fontSize: 14, color: AppColors.blue),
//           ),
//         );
//       },
//     );
//   }
// }
