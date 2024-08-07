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
class SuccessGetAllCategoriesState extends OrderServiceStates {}

class FailureGetAllCategoriesState extends OrderServiceStates {}

class LoadingGetAllCategoriesState extends OrderServiceStates {}
class LoadingProductsOfCategoryInitial extends OrderServiceStates {}

class LoadedProductsOfCategoryInitial extends OrderServiceStates {}

class ErrorProductsOfCategoryInitial extends OrderServiceStates {}
class SuccessGetAllProvidersState extends OrderServiceStates {}

class FailureGetAllProvidersState extends OrderServiceStates {}

class LoadingGetAllProvidersState extends OrderServiceStates {}
class SuccessAddServiceState extends OrderServiceStates {}

class FailureAddServiceState extends OrderServiceStates {}

class LoadingAddServiceState extends OrderServiceStates {}
