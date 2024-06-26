abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class SuccessAddMemberState extends ForgetPasswordStates {}

class FailureAddMemberState extends ForgetPasswordStates {}

class LoadingAddMemberState extends ForgetPasswordStates {}
