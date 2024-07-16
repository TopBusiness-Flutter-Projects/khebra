abstract class OrderServiceStates {}

class OrderServiceInitialState extends OrderServiceStates {}

class SuccessAddMemberState extends OrderServiceStates {}

class FailureAddMemberState extends OrderServiceStates {}

class LoadingAddMemberState extends OrderServiceStates {}
class FilePickedSuccessfully extends OrderServiceStates {}
class FileNotPicked extends OrderServiceStates {}
class FileRemovedSuccessfully extends OrderServiceStates {}
class ChangeDateState extends OrderServiceStates {}
class ChangeTimeState extends OrderServiceStates {}
