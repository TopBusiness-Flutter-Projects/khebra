import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/projects/cubit/projects_cubit.dart';
import 'package:khebra/features/projects/cubit/projects_states.dart';
import 'package:khebra/features/projects/widgets/custom_project_accepted_details.dart';

import '../../../core/widgets/custom_appBar.dart';
import '../widgets/custom_project_details_container.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<ProjectsCubit, ProjectsStates>(builder: (context, state) {
        ProjectsCubit cubit = context.read<ProjectsCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'projectDetails'.tr(),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'اسم المشروع',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        color: AppColors.secondPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      ' 11/3/2024',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.secondPrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey[300], // Set the desired color here
                  thickness: 1.0, // Optional: Set the thickness of the divider
                ),
              ),
              Text(
                cubit.currentStatus == ProjectStatus.newOffer
                    ? "priceOffers".tr()
                    : "followProject".tr(),
                style: TextStyle(
                  fontSize: 16.0.sp,
                  color: AppColors.secondPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: cubit.currentStatus == ProjectStatus.newOffer
                    ? ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomProjectDetailsContainer(
                            onPressed: () {
                              setState(() {
                                cubit.currentStatus = ProjectStatus.acceptOffer;
                              });
                            },
                          );
                        })
                    : CustomAcceptedProjectDetails(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
