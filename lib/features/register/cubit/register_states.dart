abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {}

class FailureRegisterState extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}
class SuccessUpdatePartnerState extends RegisterStates {}

class FailureUpdatePartnerState extends RegisterStates {}

class LoadingUpdatePartnerState extends RegisterStates {}

class SendCodeLoading extends RegisterStates {}

class OnSmsCodeSent extends RegisterStates {
  String smsCode;
  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends RegisterStates {}

class CheckCodeSuccessfully extends RegisterStates {}

class CheckCodeErrorfully extends RegisterStates {}