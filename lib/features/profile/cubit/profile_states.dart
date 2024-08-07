abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class SuccessGettingUserDataState extends ProfileStates {}

class FailureGettingUserDataState extends ProfileStates {}

class LoadingGettingUserDataState extends ProfileStates {}

class SuccessUpdateProfileState extends ProfileStates {}

class FailureUpdateProfileState extends ProfileStates {}

class LoadingUpdateProfileState extends ProfileStates {}

class FileNotPicked extends ProfileStates {}

class FilePickedSuccessfully extends ProfileStates {}
