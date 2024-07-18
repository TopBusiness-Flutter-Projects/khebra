import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_type_widget.dart';
import 'package:khebra/features/projects/cubit/projects_cubit.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({super.key});

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    ProjectsCubit cubit = context.read<ProjectsCubit>();
    return  SizedBox(
      height:40.h ,child: ListView(
        scrollDirection: Axis.horizontal,
       children: [
        
          GestureDetector(
              onTap: () {
                setState(() {
                  cubit.CurrentIndex = 0;
                });
                cubit.changeOrderType(0);
              },
              child: ServicesType(
                  departmentName: 'new'.tr(),
                  isSelected: cubit.orderStatus == 0)),
          GestureDetector(
              onTap: () {
                setState(() {
                  cubit.CurrentIndex = 1;
                });
          
                cubit.changeOrderType(1);
              },
              child: ServicesType(
                  departmentName: 'waiting'.tr(),
                  isSelected: cubit.orderStatus == 1)),
          GestureDetector(
              onTap: () {
                setState(() {
                  cubit.CurrentIndex = 2;
                });
          
                cubit.changeOrderType(2);
              },
              child: ServicesType(
                  departmentName: 'done'.tr(),
                  isSelected: cubit.orderStatus == 2)),
        ],
      ),
    );
  }
}


