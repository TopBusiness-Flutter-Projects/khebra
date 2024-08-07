abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class SuccessAddMemberState extends ForgetPasswordStates {}

class FailureAddMemberState extends ForgetPasswordStates {}

class LoadingAddMemberState extends ForgetPasswordStates {}
class SendCodeLoading extends ForgetPasswordStates {}

class OnSmsCodeSent extends ForgetPasswordStates {
  String smsCode;
  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends ForgetPasswordStates {}

class CheckCodeSuccessfully extends ForgetPasswordStates {}

class CheckCodeErrorfully extends ForgetPasswordStates {}