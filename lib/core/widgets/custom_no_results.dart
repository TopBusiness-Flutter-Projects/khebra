import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/utils/app_export.dart';

class CustomNoResultsWidget extends StatelessWidget {
  const CustomNoResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "no_result_found".tr(),
      style: getBoldStyle(),
    ));
  }
}
