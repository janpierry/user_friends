part of 'main_user_bloc.dart';

abstract class MainUserState extends Equatable {
  const MainUserState();

  @override
  List<Object> get props => [];
}

class MainUserInitial extends MainUserState {}

class MainUserLoading extends MainUserState {}

class MainUserLoaded extends MainUserState {
  final User user;

  const MainUserLoaded({required this.user});
}

class MainUserError extends MainUserState {
  final String message;

  const MainUserError({required this.message});
}
