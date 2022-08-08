import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/friends/domain/usecases/fetch_user_friends.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late FetchUserFriends usecase;
  late MockUserRepository mockUserRepository;
  late List<User> userFriends;

  setUp(
    () {
      mockUserRepository = MockUserRepository();
      usecase = FetchUserFriends(repository: mockUserRepository);
      userFriends = const [
        User(urlPhoto: 'urlPhoto', name: 'name', email: 'email'),
        User(urlPhoto: 'urlPhoto2', name: 'name2', email: 'email2'),
      ];
    },
  );

  test(
    'Should get the user friends from the repository',
    () async {
      // arrange
      when(() => mockUserRepository.fetchUserFriends())
          .thenAnswer((_) async => Right(userFriends));
      // act
      final result = await usecase();
      // assert
      expect(result, equals(Right(userFriends)));
    },
  );

  test(
    'should return a Failure when the repository returns a Failure',
    () async {
      // arrange
      when(() => mockUserRepository.fetchUserFriends())
          .thenAnswer((_) async => Left(ProvisoryFailure()));
      // act
      final result = await usecase();
      // assert
      expect(result, equals(Left(ProvisoryFailure())));
    },
  );
}
