import 'package:user_friends/modules/core/error/exceptions.dart';
import 'package:user_friends/modules/core/network/network_info.dart';
import 'package:user_friends/modules/shared/data/datasources/user_datasource.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;
  final NetworkInfo networkInfo;

  const UserRepositoryImpl({
    required this.datasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> fetchMainUser() async {
    if (!(await networkInfo.isConnected)) {
      return Left(ConnectionFailure());
    }

    try {
      final mainUser = await datasource.fetchMainUser();
      return Right(mainUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> fetchUserFriends() async {
    if (!(await networkInfo.isConnected)) {
      return Left(ConnectionFailure());
    }

    try {
      final userFriends = await datasource.fetchUserFriends();
      return Right(userFriends);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
