import 'package:dartz/dartz.dart';
import 'package:user_friends/modules/core/error/failures.dart';

import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> fetchMainUser();
  Future<Either<Failure, List<User>>> fetchUserFriends();
}
