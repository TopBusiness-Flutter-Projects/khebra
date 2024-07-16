import 'package:easy_localization/easy_localization.dart';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/cubit/orders_service_states.dart';

import '../../../../core/widgets/custom_drop_down_menu.dart';

class CustomDateWidget extends StatefulWidget {
  const CustomDateWidget({
    super.key,
  });

  @override
  State<CustomDateWidget> createState() => _CustomDateWidgetState();
}

class _CustomDateWidgetState extends State<CustomDateWidget> {
  String? dropdownValue;

  @override
  void initState() {
    //  context.read<OrderServiceCubit>().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderServiceCubit cubit = context.read<OrderServiceCubit>();

    return BlocConsumer<OrderServiceCubit, OrderServiceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return EasyDateTimeLine(
          activeColor: AppColors.primary,
          initialDate: DateTime.now(),

          // ignore: prefer_collection_literals
          disabledDates: [
            for (int i = 0;
                i < DateTime.now().millisecondsSinceEpoch;
                i += 86400000)
              if (DateTime.fromMillisecondsSinceEpoch(i).day !=
                      DateTime.now().day ||
                  DateTime.fromMillisecondsSinceEpoch(i).month !=
                      DateTime.now().month ||
                  DateTime.fromMillisecondsSinceEpoch(i).year !=
                      DateTime.now().year)
                DateTime.fromMillisecondsSinceEpoch(i),
          ].toSet().toList(),
          onDateChange: (selectedDate) {
            print(selectedDate.toString());
            cubit.changeTheDate(selectedDate.toString());
            //`selectedDate` the new date selected.
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            todayStyle: DayStyle(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
            ),
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 2), // Shadow position
                  )
                ],
              ),
            ),
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22)),
                color: AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
