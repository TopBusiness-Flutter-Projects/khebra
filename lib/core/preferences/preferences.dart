import 'dart:convert';

import 'package:khebra/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static final Preferences instance = Preferences._internal();
  Preferences._internal();
  factory Preferences() => instance;

  ////notification
  bool notiSound = true;
  bool notiVisbrate = true;
  bool notiLight = true;

  Future<void> setNotiSound({bool status = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notiSound', status);
  }

  Future<bool?> getNotiSound() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      notiSound = prefs.getBool('notiSound') ?? true;
    } catch (e) {
      notiSound = true;
    }
    return notiSound;
  }

  Future<void> setNotiVibrate({bool status = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notiVibrate', status);
  }

  Future<bool?> getNotiVibrate() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      notiVisbrate = prefs.getBool('notiVibrate') ?? true;
    } catch (e) {
      notiVisbrate = true;
    }
    return notiVisbrate;
  }

  Future<void> setNotiLights({bool status = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notiLights', status);
  }

  Future<bool?> getNotiLights() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      notiLight = prefs.getBool('notiLights') ?? true;
    } catch (e) {
      notiLight = true;
    }
    return notiLight;
  }

  Future<String> getSavedLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(AppStrings.locale) ?? 'ar';
  }

  Future<void> savedLang(String local) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(AppStrings.locale, local);
  }
  //////////////////////////////////

// set user
  // Future<void> setUser(LoginModel loginResponse) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(
  //       'user', jsonEncode(LoginModel.fromJson(loginResponse.toJson())));
  //   print(await getUserModel());
  // }
  // Future<void> clearUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove('user');
  //   print(await getUserModel());
  // }

  // Future<LoginModel> getUserModel() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? jsonData = preferences.getString('user');
  //   LoginModel userModel;
  //   if (jsonData != null) {
  //     userModel = LoginModel.fromJson(jsonDecode(jsonData));
  //   } else {
  //     userModel = LoginModel();
  //   }
  //   return userModel;
  // }

  Future<void> clearShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<bool?> getIsFirstTime({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  Future<dynamic> setIsFirstTime({required String key, required value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }
// user  token

  Future<String?> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('userToken');
  }

  Future<dynamic> setUserToken({required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('userToken', value);
  }

  Future<void> deleteUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('userToken');
  }
// user access token

  Future<String?> getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('accessToken');
  }

  Future<dynamic> setAccessToken({required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('accessToken', value);
  }

  // Notification token
  Future<String?> getNotificationToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('notificationToken');
  }

  Future<dynamic> setNotificationToken({required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('notificationToken', value);
  }

  Future<bool?> getPrivacyAccepted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('privacyAccepted');
  }

  Future<dynamic> setPrivacyAccepted({required bool value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool('privacyAccepted', value);
  }

// set point

  Future<String?> getMyChannelId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('channelId');
  }

  Future<dynamic> setMyChannelId({required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('channelId', value);
  }
//
//
  // static dynamic getData({required String key}) {
  //   return sharedPreferences!.get(key);
  // }
  //
  // static Future<dynamic> saveData({required String key, required value}) async {
  //   if (value is String) return await sharedPreferences!.setString(key, value);
  //   if (value is int) return await sharedPreferences!.setInt(key, value);
  //   if (value is bool) return await sharedPreferences!.setBool(key, value);
  //   if (value is double) return await sharedPreferences!.setDouble(key, value);
  //   if (value is List<String>) {
  //     return await sharedPreferences!.setStringList(key, value);
  //   }
  // }
  //
  // static Future<dynamic> removeData({required String key}) {
  //   return sharedPreferences!.remove(key);
  // }
  //
}
