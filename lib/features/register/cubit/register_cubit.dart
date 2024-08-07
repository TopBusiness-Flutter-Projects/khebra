// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:khebra/core/remote/service.dart';
import 'package:khebra/core/utils/app_export.dart';

import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.api) : super(RegisterInitialState());
  ServiceApi api;

  //! OTP
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _mAuth = FirebaseAuth.instance;
  String? verificationId;
  String? smsCode;
  int? resendToken;

  String countryCode = '+20';
  String phone = "+201027639683";
  bool isRegisterUser = true;
  sendOTP(BuildContext context) async {
    print("cccc");
    emit(SendCodeLoading());
    //
    await _mAuth
        .verifyPhoneNumber(
      //  phoneNumber: phone,
      phoneNumber: "$countryCode${phoneNumberController.text}",
      verificationCompleted: (PhoneAuthCredential credential) {
        print('=========================================');
        print("verificationId=>$verificationId");
        print('smsCode : $smsCode');
        print('=========================================');
        smsCode = credential.smsCode;

        verificationId = credential.verificationId;
        emit(OnSmsCodeSent(smsCode ?? ''));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(CheckCodeInvalidCode());
        print("Errrrorrrrr : ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        this.resendToken = resendToken;
        this.verificationId = verificationId;
        print("verificationId=>$verificationId");
        emit(OnSmsCodeSent(''));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
        print('*************************************');
        print("verificationId=>$verificationId");
        print('smsCode : $smsCode');
        print('*************************************');
      },
    )
        .then((value) {
      Navigator.pushNamed(context, Routes.otpScreenRoute, arguments: true);
    });
  }

  verifyOtp(String otpCode, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otpCode);
    //!  OTP validate true or false
    await _mAuth.signInWithCredential(credential).then((value) {
      emit(CheckCodeSuccessfully());
      debugPrint("success");
      //! loginAuth

      register(context);
    }).catchError((error) {
      errorGetBar(error.toString());

      emit(CheckCodeErrorfully());
    });
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  register(BuildContext context) async {
    emit(LoadingRegisterState());
    final response = await api.register(
        name: nameController.text,
        phoneOrMail: phoneNumberController.text,
        password: passwordController.text);
    response.fold((l) {
      errorGetBar(l.message??"");
      emit(FailureRegisterState());
    }, (r) async {
      if (r.result != null) {
        updatePartner(
          context,
          userId: r.result,
        );
        emit(SuccessRegisterState());
      } else {
        errorGetBar("حدث خطأ ما");
      }
    });
  }

  updatePartner(BuildContext context, {required int userId}) async {
    emit(LoadingUpdatePartnerState());

    final response = await api.updatePartner(
        address: addressController.text,
        image: "",
        mobile: phoneNumberController.text,
        userId: userId);
    response.fold((l) {
      errorGetBar("d");
      emit(FailureUpdatePartnerState());
    }, (r) async {
      if (r.result != null) {
        String sessionId = await api.getSessionId(
            phone: phoneNumberController.text,
            password: passwordController.text);

        await Preferences.instance.setSessionId(sessionId);

        await Preferences.instance.setUserName(phoneNumberController.text);
        await Preferences.instance.setUserPass(passwordController.text);

        Preferences.instance.setUserId(userId.toString());
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainRoute, (route) => false);

        emit(SuccessUpdatePartnerState());
      } else {
        errorGetBar("حدث خطأ ما");
      }
    });
  }
}
