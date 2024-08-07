// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_technicians_container.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                title: "favourites",
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
