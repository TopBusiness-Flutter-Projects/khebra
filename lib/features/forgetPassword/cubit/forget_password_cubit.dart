// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:khebra/core/remote/service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_export.dart';
import 'forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(this.api) : super(ForgetPasswordInitialState());
  ServiceApi api;
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
      phoneNumber: phone,
      // phoneNumber: countryCode + phoneController.text ,
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
      Navigator.pushNamed(context, Routes.otpScreenRoute, arguments: false);
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
      Navigator.pushNamed(context, Routes.newPasswordScreenRoute);
    }).catchError((error) {
      errorGetBar(error.toString());

      emit(CheckCodeErrorfully());
    });
  }
}
