import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_friends/modules/core/utils/string_mapper.dart';

import '../../../../shared/domain/entities/user.dart';
import '../../../domain/usecases/fetch_user_friends.dart';

part 'user_friends_event.dart';
part 'user_friends_state.dart';

class UserFriendsBloc extends Bloc<UserFriendsEvent, UserFriendsState> {
  final FetchUserFriends fetchUserFriends;

  UserFriendsBloc({required this.fetchUserFriends})
      : super(UserFriendsInitial()) {
    on<FetchUserFriendsEvent>(_onFetchUserFriends);
  }

  FutureOr<void> _onFetchUserFriends(
    UserFriendsEvent event,
    Emitter<UserFriendsState> emitter,
  ) async {
    emitter(UserFriendsLoading());
    final failureOrUserFriends = await fetchUserFriends();
    failureOrUserFriends.fold(
      (failure) => emitter(
        UserFriendsError(message: StringMapper.mapFailureToMessage(failure)),
      ),
      (userFriends) => emitter(UserFriendsLoaded(userFriends: userFriends)),
    );
  }
}
