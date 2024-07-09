abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class SuccessAddMemberState extends ProfileStates {}

class FailureAddMemberState extends ProfileStates {}

class LoadingAddMemberState extends ProfileStates {}

class FileNotPicked extends ProfileStates {}

class FilePickedSuccessfully extends ProfileStates {}
