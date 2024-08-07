import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/screens/widgets/custom_technicians_container.dart';

class TechniciansSection extends StatelessWidget {
  const TechniciansSection({
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
          itemBuilder: (context, index) => CustomTechniciansContainer(
                categoryName:
                    cubit.getAllProviderModel.result![index].name ?? "",
                name: cubit.getAllProviderModel.result![index].name ?? "",
                image: cubit.getAllProviderModel.result![index].image1920 ??
                    "false",
              
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: cubit.getAllProviderModel.result!.length >= 5
              ? 5
              : cubit.getAllProviderModel.result!.length),
    );
  }
}
