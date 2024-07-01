import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomContactWidget extends StatelessWidget {
  const CustomContactWidget({
    super.key, required this.phone,
  });
final String phone;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
        onTap: () async {

              var whatsappUrl = "whatsapp://send?phone=$phone";

    var whatsappUrlIos =
        "https://api.whatsapp.com/send?phone=$phone=";
        // "https://api.whatsapp.com/send?phone=+964${settingsModel.data!.phone}=";
    final _url = Uri.parse(whatsappUrl);
    final _urlIos = Uri.parse(whatsappUrlIos);

    if (GetPlatform.isIOS) {
      launchUrl(
        _urlIos,
        mode: LaunchMode.externalApplication,
      );
    } else {
      launchUrl(
        _url,
        mode: LaunchMode.externalApplication,
      );
    }
        },
        child: Image.asset(
          AppIcons.whatsApp,
          width: 25.w,
          height: 25.w,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () async {

            String url = 'tel:$phone';

            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            } else {
              throw 'Could not launch $url';
            }
        },
        child: Image.asset(
          AppIcons.call,
          width: 25.w,
          height: 25.w,
        ),
      ),
    ]);
  }
}
