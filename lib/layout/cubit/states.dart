
class HomeState{}
class InitialState extends HomeState{}

/// user state
class GetUserSuccessState extends HomeState{}
class GetUserErrorState extends HomeState{}
class GetUserLoadingState extends HomeState{}



/// todos state
class GetTodosLoadingState extends HomeState{}
class GetTodosSuccessState extends HomeState{}
class GetTodosErrorState extends HomeState{}