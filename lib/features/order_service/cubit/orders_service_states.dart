abstract class OrderServiceStates {}

class OrderServiceInitialState extends OrderServiceStates {}

class SuccessAddMemberState extends OrderServiceStates {}

class FailureAddMemberState extends OrderServiceStates {}

class LoadingAddMemberState extends OrderServiceStates {}
