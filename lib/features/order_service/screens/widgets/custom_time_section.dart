import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/screens/widgets/custom_uploaded_image.dart';

import 'custom_upload_decument.dart';

class CustomTimeSection extends StatelessWidget {
  const CustomTimeSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    OrderServiceCubit cubit = context.read<OrderServiceCubit>();

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
      child: Wrap(
        alignment: WrapAlignment.center,

        direction: Axis.horizontal,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...cubit.timesList.map(
            (e) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              child: GestureDetector(
                onTap: () {
                  print("object");

                  cubit.changeSelecttime(e);
                },
                child: CustomTimeContainer(
                  text: e,
                  isSelected: e == cubit.selectedTime,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTimeContainer extends StatelessWidget {
  const CustomTimeContainer({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: AppColors.primary,
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 5), // Shadow position
                  )
                ],
              ),
        // padding: const EdgeInsets.all(6),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 9.h),
          child: Text(
            text,
            style: getRegularStyle(
              fontHeight: 1,
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          ),
        ));
  }
}
