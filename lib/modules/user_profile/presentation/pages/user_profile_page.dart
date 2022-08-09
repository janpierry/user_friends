import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_friends/dependency_injection/service_locator.dart';
import 'package:user_friends/modules/shared/presentation/pages/error_page.dart';
import 'package:user_friends/modules/user_profile/presentation/widgets/profile_content.dart';

import '../bloc/main_user/main_user_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainUserBloc>(),
      child: const UserProfileView(),
    );
  }
}

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MainUserBloc>(context).add(FetchMainUserEvent());

    return Scaffold(
      appBar: AppBar(title: const Text('User profile')),
      body: Center(
        child: BlocBuilder<MainUserBloc, MainUserState>(
          builder: (context, state) {
            if (state is MainUserInitial || state is MainUserLoading) {
              return const CircularProgressIndicator();
            } else if (state is MainUserLoaded) {
              return ProfileContent(mainUser: state.user);
            }
            return ErrorPage(errorMessage: (state as MainUserError).message);
          },
        ),
      ),
    );
  }
}
