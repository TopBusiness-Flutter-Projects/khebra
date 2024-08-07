// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/cubit/orders_service_states.dart';

import 'widgets/custom_provider_widget.dart';

class FilteredTechniciansScreen extends StatefulWidget {
  const FilteredTechniciansScreen({Key? key, }) : super(key: key);
  
  @override
  State<FilteredTechniciansScreen> createState() =>
      _FilteredTechniciansScreenState();
}

class _FilteredTechniciansScreenState extends State<FilteredTechniciansScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OrderServiceCubit, OrderServiceStates>(
          builder: (context, state) {
        OrderServiceCubit cubit = context.read<OrderServiceCubit>();

        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                title: "technicians",
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10.w),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: CustomTextField(
              //           labelText: 'filter'.tr(),
              //           borderRadius: 20,
              //           prefixIcon: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Image.asset(
              //               AppImages.search,
              //               fit: BoxFit.fill,
              //               width: 8.w,
              //               height: 8.w,
              //             ),
              //           ),
              //           keyboardType: TextInputType.text,
              //           controller: searchController,
              //           validator: (value) => value!.isEmpty ? '' : null,
              //         ),
              //       ),
              //       SizedBox(width: 10.w),
              //       Image.asset(
              //         AppImages.filter,
              //         width: 50.w,
              //       )
              //     ],
              //   ),
              // ),
              Expanded(
                child: cubit.getAllProviderModel.result == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.getAllProviderModel.result!.isEmpty
                        ? CustomNoResultsWidget()
                        : ListView.separated(
                            itemCount: cubit.getAllProviderModel.result!.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                cubit.addService(context,
                                    providerId: cubit.getAllProviderModel
                                        .result![index].id!,
                                       
                                        );
                              },
                              child: CustomProviderWidget(
                                name: cubit
                                    .getAllProviderModel.result![index].name!,
                                image: cubit.getAllProviderModel.result![index]
                                    .image1920,
                              ),
                            ),
                          ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
