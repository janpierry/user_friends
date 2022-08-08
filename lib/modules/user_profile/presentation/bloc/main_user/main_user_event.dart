part of 'main_user_bloc.dart';

abstract class MainUserEvent extends Equatable {
  const MainUserEvent();

  @override
  List<Object> get props => [];
}

class FetchMainUserEvent extends MainUserEvent {}
