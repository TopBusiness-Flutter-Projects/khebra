// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';

import 'package:khebra/features/profile/cubit/profile_cubit.dart';
import 'package:khebra/features/profile/cubit/profile_states.dart';

import '../../../core/utils/app_export.dart';
import 'widgets/custom_bill_container.dart';

class MyBillsScreen extends StatefulWidget {
  const MyBillsScreen({Key? key}) : super(key: key);

  @override
  State<MyBillsScreen> createState() => _MyBillsScreenState();
}

class _MyBillsScreenState extends State<MyBillsScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<ProfileCubit, ProfileStates>(builder: (context, state) {
        ProfileCubit cubit = context.read<ProfileCubit>();
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: "myBills"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CustomBillContainer(
                                  //orderModel: cubit
                                  //    .getOrdersModel!
                                  //    .data!
                                  //    .old![index],
                                  isCurrent: false,
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15.h,
                                ),
                            itemCount: 5)
                      ]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
