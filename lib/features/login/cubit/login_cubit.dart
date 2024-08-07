// ignore_for_file: use_build_context_synchronously

import 'package:khebra/core/models/login_model.dart';
import 'package:khebra/core/remote/service.dart';

import '../../../core/utils/app_export.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.api) : super(LoginInitialState());
  ServiceApi api;
  AuthModel? authModel;

 Future<String> setSessionId(
      {required String phoneOrMail, required String password}) async {
    String mySessionId =
        await api.getSessionId(phone: phoneOrMail, password: password);

    return mySessionId;
  }

  login(BuildContext context,
      {required String phoneOrMail,
      required String password,
      bool iSVisitor = false}) async {
    emit(LoadingLoginState());
    AppWidget.createProgressDialog(context, 'انتظر');
    final response = await api.login(phoneOrMail, password);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(l.message??'');
      emit(FailureLoginState());
    }, (r) async {
      if (r.result != null) {
        authModel = r;
        String sessionId =
            await api.getSessionId(phone: phoneOrMail, password: password);
        emit(SuccessLoginState());
        await Preferences.instance.setSessionId(sessionId);
        if (!iSVisitor) {
          await Preferences.instance.setUserName(phoneOrMail);
          await Preferences.instance.setUserPass(password);
        }
        Navigator.pop(context);
        Preferences.instance.setUserId(r.result!.userContext!.uid.toString());
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainRoute, (route) => false);
      } else {
        errorGetBar("حدث خطأ ما");
        Navigator.pop(context);
      }
    });
  }
}
