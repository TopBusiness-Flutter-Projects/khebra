abstract class ProjectsStates {}

class ProjectsInitialState extends ProjectsStates {}

class SuccessAddMemberState extends ProjectsStates {}

class FailureAddMemberState extends ProjectsStates {}

class LoadingAddMemberState extends ProjectsStates {}
class ChangeProjectTypeStates extends ProjectsStates {}
