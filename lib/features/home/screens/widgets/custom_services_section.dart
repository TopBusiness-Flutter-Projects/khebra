import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';

import 'custom_service_container.dart';

class ServiciesSection extends StatelessWidget {
  const ServiciesSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return SizedBox(
      height: 190.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CustomServiceContainer(
          image: cubit.productsModel.result![index].image1920,
          listPrice: cubit.productsModel.result![index].listPrice ?? 0.0,
          mainText: cubit.productsModel.result![index].name ?? "",
          withPrice: cubit.productsModel.result![index].listPrice != 0.0,
          containerOnTap: () {},
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 5.w,
        ),
        itemCount: cubit.productsModel.result!.length >= 4
            ? 4
            : cubit.productsModel.result!.length,
      ),
    );
  }
}
