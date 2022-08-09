import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:user_friends/modules/core/network/network_info.dart';
import 'package:user_friends/modules/friends/domain/usecases/fetch_user_friends.dart';
import 'package:user_friends/modules/friends/presentation/bloc/user_friends/user_friends_bloc.dart';
import 'package:user_friends/modules/shared/data/datasources/user_datasource.dart';
import 'package:user_friends/modules/shared/data/repositories/user_repository.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';
import 'package:user_friends/modules/user_profile/domain/usecases/fetch_main_user.dart';
import 'package:user_friends/modules/user_profile/presentation/bloc/main_user/main_user_bloc.dart';

final getIt = GetIt.instance;

void init() async {
  // Blocs
  getIt.registerFactory(() => MainUserBloc(fetchMainUser: getIt()));
  getIt.registerFactory(() => UserFriendsBloc(fetchUserFriends: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => FetchMainUser(repository: getIt()));
  getIt.registerLazySingleton(() => FetchUserFriends(repository: getIt()));

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(datasource: getIt(), networkInfo: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<UserDatasource>(
    () => UserDatasourceImpl(client: getIt()),
  );

  // Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // External
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
