import 'package:dartz/dartz.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';

class FetchUserFriends {
  final UserRepository repository;

  FetchUserFriends({required this.repository});

  Future<Either<Failure, List<User>>> call() {
    return repository.fetchUserFriends();
  }
}
