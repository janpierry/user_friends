import 'package:dartz/dartz.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';

class FetchMainUser {
  final UserRepository repository;

  FetchMainUser({required this.repository});

  Future<Either<Failure, User>> call() {
    return repository.fetchMainUser();
  }
}
