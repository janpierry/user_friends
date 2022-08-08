import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';
import 'package:user_friends/modules/user_profile/domain/usecases/fetch_main_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late FetchMainUser usecase;
  late MockUserRepository mockUserRepository;
  late User user;

  setUp(
    () {
      mockUserRepository = MockUserRepository();
      usecase = FetchMainUser(repository: mockUserRepository);
      user = const User(photoUrl: 'photoUrl', name: 'name', email: 'email');
    },
  );

  test(
    'should get the main user from the repository',
    () async {
      // arrange
      when(() => mockUserRepository.fetchMainUser())
          .thenAnswer((_) async => Right(user));
      // act
      final result = await usecase();
      // assert
      expect(result, equals(Right(user)));
    },
  );

  test(
    'should return a Failure when the repository returns a Failure',
    () async {
      // arrange
      when(() => mockUserRepository.fetchMainUser())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await usecase();
      // assert
      expect(result, equals(Left(ServerFailure())));
    },
  );
}
