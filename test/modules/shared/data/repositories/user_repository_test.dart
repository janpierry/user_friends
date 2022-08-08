import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_friends/modules/core/error/exceptions.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/core/network/network_info.dart';
import 'package:user_friends/modules/shared/data/datasources/user_datasource.dart';
import 'package:user_friends/modules/shared/data/repositories/user_repository.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/shared/domain/repositories/user_repository.dart';

class MockUserDatasource extends Mock implements UserDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late UserRepository repository;
  late MockUserDatasource mockUserDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(
    () {
      mockUserDatasource = MockUserDatasource();
      mockNetworkInfo = MockNetworkInfo();
      repository = UserRepositoryImpl(
        datasource: mockUserDatasource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

  group('fetchMainUser', () {
    late User user;

    setUp(
      () {
        user = const User(photoUrl: 'photoUrl', name: 'name', email: 'email');
      },
    );

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockUserDatasource.fetchMainUser())
            .thenAnswer((_) async => user);
        // act
        await repository.fetchMainUser();
        // assert
        verify(() => mockNetworkInfo.isConnected);
      },
    );

    test(
      'should return the user from the datasource when the call to datasource is successful',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockUserDatasource.fetchMainUser())
            .thenAnswer((_) async => user);
        // act
        final result = await repository.fetchMainUser();
        // assert
        verify(() => mockUserDatasource.fetchMainUser());
        expect(result, equals(Right(user)));
      },
    );

    test(
      'should return ServerFailure when the call to datasource is unsuccessful',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockUserDatasource.fetchMainUser())
            .thenThrow(ServerException());
        // act
        final result = await repository.fetchMainUser();
        // assert
        verify(() => mockUserDatasource.fetchMainUser());
        expect(result, equals(Left(ServerFailure())));
      },
    );

    test(
      'should return ConnectionFailure when there is not internet connection',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repository.fetchMainUser();
        // assert
        verify(() => mockNetworkInfo.isConnected);
        verifyZeroInteractions(mockUserDatasource);
        expect(result, Left(ConnectionFailure()));
      },
    );
  });

  group('fetchUserFriends', () {
    late List<User> userFriends;

    setUp(
      () {
        userFriends = const [
          User(photoUrl: 'photoUrl', name: 'name', email: 'email'),
          User(photoUrl: 'photoUrl2', name: 'name2', email: 'email2'),
        ];
      },
    );

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockUserDatasource.fetchUserFriends())
            .thenAnswer((_) async => userFriends);
        // act
        await repository.fetchUserFriends();
        // assert
        verify(() => mockNetworkInfo.isConnected);
      },
    );

    test(
      'should return the user friends from the datasource when the call to datasource is successful',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockUserDatasource.fetchUserFriends())
            .thenAnswer((_) async => userFriends);
        // act
        final result = await repository.fetchUserFriends();
        // assert
        verify(() => mockUserDatasource.fetchUserFriends());
        expect(result, equals(Right(userFriends)));
      },
    );

    test(
      'should return ServerFailure when the call to datasource is unsuccessful',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(() => mockUserDatasource.fetchUserFriends())
            .thenThrow(ServerException());
        // act
        final result = await repository.fetchUserFriends();
        // assert
        verify(() => mockUserDatasource.fetchUserFriends());
        expect(result, equals(Left(ServerFailure())));
      },
    );

    test(
      'should return ConnectionFailure when there is not internet connection',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repository.fetchUserFriends();
        // assert
        verify(() => mockNetworkInfo.isConnected);
        verifyZeroInteractions(mockUserDatasource);
        expect(result, Left(ConnectionFailure()));
      },
    );
  });
}
