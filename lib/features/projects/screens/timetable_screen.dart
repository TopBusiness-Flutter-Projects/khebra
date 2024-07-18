import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/features/projects/cubit/projects_cubit.dart';
import 'package:khebra/features/projects/cubit/projects_states.dart';
import 'package:khebra/features/projects/widgets/customButton.dart';

import '../../../core/utils/app_export.dart';
import '../widgets/calender.dart';
import '../widgets/date_picker.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});
  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) {
    ProjectsCubit cubit = context.read<ProjectsCubit>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: 'timetable'.tr(),
          ),
          const CalenderToday(),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return MissionDetailsContainer(
                  isChecked: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MissionDetailsContainer extends StatelessWidget {
  const MissionDetailsContainer({super.key, required this.isChecked});
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsStates>(
        builder: (context, state) {
      ProjectsCubit cubit = context.read<ProjectsCubit>();
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.secondPrimary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      // setState(() {
                      //   // cubit.checkboxStates[index] = value ?? false;
                      // });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(color: AppColors.primary, width: 2),
                    activeColor: AppColors.checkbox,
                    checkColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  width: 1.w,
                  height: 90.h,
                  color: AppColors.primary,
                ),
              ],
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'وصف المشuhbuvuvuvuuvsndjnbijbsvibibdfdbbbbbbbbbbbbnoncccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbuروع وصف ع',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.secondPrimary),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
