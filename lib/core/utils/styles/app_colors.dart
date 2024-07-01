import 'package:flutter/material.dart';
import '../hex_color.dart';

class AppColors {
  static Color primary = HexColor('#F27D00');
  static Color primaryGrey = HexColor('#525252');
  static Color secondPrimary = HexColor('#10275C');
  static Color primaryText = HexColor('#272727');
  static Color primaryHint = HexColor('#B2B2B2');
  static Color textColor2 = HexColor('#362C29');
  static Color appBarText = HexColor('#525252');
  static Color menuTextColor = HexColor('#545454');
  static Color grey = HexColor('#747474');
  static Color grey2 = HexColor('#205960');
  static Color grey3 = HexColor('#767676');
    static Color secondTextColor = HexColor('#373737');
    static Color dotsColor = HexColor('#F5F5F5');
    static Color orderWaiting = HexColor('#FFFDEC');
    static Color orderDone = HexColor('#EBFFEE');
    static Color orderDetails = HexColor('#FCECDB');
    static Color orderCompleted = HexColor('##F2F2F2');

  static Color notificationFont = HexColor('#404040');
  static Color settingDivider = HexColor('#DADADA');
  static Color blue = HexColor('#110E43');
  static Color darkBlue = HexColor('#110E45');
  static Color indicatorBackground = HexColor('#D9D9D9');
  static Color settingFont = HexColor('#37474F');
  static Color logOutFont = HexColor('#BE3033');
  static Color privacyDialogFont = HexColor('#4F4C6D');
  static Color overlayBackfround = HexColor('#FEE9C7');
  //static Color dotsColor = const Color(0xff10275C).withOpacity(.3);
  static Color greyBackground = const Color(0x42FCAB26);
  static Color blackText = HexColor('#110101');
  static Color orange = HexColor('#FF7A00');
  static Color blueSubscribes = HexColor('#50C5DF');
  static Color red = HexColor('#BE3033');
  static Color redButton = HexColor('#DE0000');
  static Color pink = HexColor('#D27CF0');
  static Color rewardBoxGrey = HexColor('#D2D2D2');

  static Color hint = Colors.grey;
  static Color blackLite = Colors.black54;
  static Color error = Colors.red;
  static Color success = Colors.green;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color gray = Colors.grey;
  static Color grayLite = Colors.grey[700]!;
  static Color gray1 = HexColor('#C4C4C4');
  static Color gray2 = HexColor('#BABABB');

  static Color blue3 = Color(0xff3646ff);
  static Color bink = HexColor('#FF9F9F');
  static Color purple1 = HexColor('#854AA4');
  static Color purple1light = HexColor('#E3D2FE');

  static Color blue1 = HexColor('#CBDFF8');
  static Color blue2 = HexColor('#8290F8');
  static Color blue4 = Color(0xff3E3F68);
  static Color bluelight = HexColor('#D7EAF9');

  static Color orangelight = HexColor('#FFEAD7');
  static Color opacityWhite = Colors.white.withOpacity(0.5);
  static Color transparent = Colors.transparent;

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lightens(String color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(HexColor(color));
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
