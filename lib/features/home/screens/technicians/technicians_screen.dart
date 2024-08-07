// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_technicians_container.dart';

class TechniciansScreen extends StatefulWidget {
  const TechniciansScreen({Key? key}) : super(key: key);

  @override
  State<TechniciansScreen> createState() => _TechniciansScreenState();
}

class _TechniciansScreenState extends State<TechniciansScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                title: "technicians",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'filter'.tr(),
                        borderRadius: 20,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.search,
                            fit: BoxFit.fill,
                            width: 8.w,
                            height: 8.w,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        validator: (value) => value!.isEmpty ? '' : null,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      AppImages.filter,
                      width: 50.w,
                    )
                  ],
                ),
              ),
              Expanded(
                child: cubit.getAllProviderModel.result == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.getAllProviderModel.result!.isEmpty
                        ? CustomNoResultsWidget()
                        : SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: StaggeredGrid.count(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5.w,
                                        crossAxisSpacing: 20.w,
                                        children: List.generate(
                                          cubit.getAllProviderModel.result!
                                              .length,
                                          (index) => CustomTechniciansContainer(
                                            categoryName: cubit
                                                    .getAllProviderModel
                                                    .result![index]
                                                    .name ??
                                                "",
                                            name: cubit.getAllProviderModel
                                                    .result![index].name ??
                                                "",
                                            image: cubit.getAllProviderModel
                                                    .result![index].image1920 ??
                                                "false",
                                          ),
                                        )),
                                  ),
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
