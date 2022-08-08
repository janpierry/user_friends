part of 'user_friends_bloc.dart';

abstract class UserFriendsEvent extends Equatable {
  const UserFriendsEvent();

  @override
  List<Object> get props => [];
}

class FetchUserFriendsEvent extends UserFriendsEvent {}
