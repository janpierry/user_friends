part of 'user_friends_bloc.dart';

abstract class UserFriendsState extends Equatable {
  const UserFriendsState();

  @override
  List<Object> get props => [];
}

class UserFriendsInitial extends UserFriendsState {}

class UserFriendsLoading extends UserFriendsState {}

class UserFriendsLoaded extends UserFriendsState {
  final List<User> userFriends;

  const UserFriendsLoaded({required this.userFriends});
}

class UserFriendsError extends UserFriendsState {
  final String message;

  const UserFriendsError({required this.message});
}
