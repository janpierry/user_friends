import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_friends/dependency_injection/service_locator.dart';
import 'package:user_friends/modules/friends/presentation/bloc/user_friends/user_friends_bloc.dart';
import 'package:user_friends/modules/friends/presentation/widgets/friends_content.dart';
import 'package:user_friends/modules/shared/presentation/widgets/error_content.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserFriendsBloc>(
      create: (context) => getIt<UserFriendsBloc>(),
      child: const FriendsView(),
    );
  }
}

class FriendsView extends StatelessWidget {
  const FriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserFriendsBloc>(context).add(FetchUserFriendsEvent());

    return Scaffold(
        appBar: AppBar(title: const Text('Friends')),
        body: Center(
          child: BlocBuilder<UserFriendsBloc, UserFriendsState>(
            builder: (context, state) {
              if (state is UserFriendsInitial || state is UserFriendsLoading) {
                return const CircularProgressIndicator();
              } else if (state is UserFriendsLoaded) {
                return FriendsContent(friends: state.userFriends);
              }
              return ErrorContent(
                  errorMessage: (state as UserFriendsError).message);
            },
          ),
        ));
  }
}
