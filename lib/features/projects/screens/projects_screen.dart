import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';

import '../../../core/utils/app_export.dart';
import '../cubit/projects_cubit.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_container.dart';


class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
            ProjectsCubit cubit = context.read<ProjectsCubit>();

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'myProjects'.tr(),
          ),
          CustomCardWidget(),
           CustomContainerWidget()
        ],
      ),
    );
  }
}
