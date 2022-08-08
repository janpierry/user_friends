import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_friends/modules/user_profile/domain/usecases/fetch_main_user.dart';

import '../../../../core/utils/string_mapper.dart';
import '../../../../shared/domain/entities/user.dart';

part 'main_user_event.dart';
part 'main_user_state.dart';

class MainUserBloc extends Bloc<MainUserEvent, MainUserState> {
  final FetchMainUser fetchMainUser;

  MainUserBloc({required this.fetchMainUser}) : super(MainUserInitial()) {
    on<FetchMainUserEvent>(_onFetchMainUser);
  }

  FutureOr<void> _onFetchMainUser(
    FetchMainUserEvent event,
    Emitter<MainUserState> emitter,
  ) async {
    emitter(MainUserLoading());
    final failureOrUser = await fetchMainUser();
    failureOrUser.fold(
        (failure) => emitter(
            MainUserError(message: StringMapper.mapFailureToMessage(failure))),
        (user) => emitter(MainUserLoaded(user: user)));
  }
}
