import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/core/utils/consts.dart';
import 'package:user_friends/modules/friends/domain/usecases/fetch_user_friends.dart';
import 'package:user_friends/modules/friends/presentation/bloc/user_friends/user_friends_bloc.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';

class MockFetchUserFriends extends Mock implements FetchUserFriends {}

void main() {
  late UserFriendsBloc bloc;
  late MockFetchUserFriends mockFetchUserFriends;
  late List<User> userFriends;

  setUp(
    () {
      mockFetchUserFriends = MockFetchUserFriends();
      bloc = UserFriendsBloc(fetchUserFriends: mockFetchUserFriends);
      userFriends = const [
        User(photoUrl: 'photoUrl', name: 'name', email: 'email'),
        User(photoUrl: 'photoUrl2', name: 'name2', email: 'email2'),
      ];
    },
  );

  test(
    'initial state should be [UserFriendsInitial]',
    () {
      // assert
      expect(bloc.state, UserFriendsInitial());
    },
  );

  test(
    'should get the user friends from the FetchUserFriends usecase',
    () async {
      // arrange
      when(() => mockFetchUserFriends())
          .thenAnswer((_) async => Right(userFriends));
      // act
      bloc.add(FetchUserFriendsEvent());
      await untilCalled(() => mockFetchUserFriends());
      // assert
      verify(() => mockFetchUserFriends());
    },
  );

  test(
    'should emit [UserFriendsLoading, UserFriendsLoaded] when data is gotten successfully',
    () {
      // arrange
      when(() => mockFetchUserFriends())
          .thenAnswer((_) async => Right(userFriends));
      // act
      bloc.add(FetchUserFriendsEvent());
      // assert later
      final expected = [
        UserFriendsLoading(),
        UserFriendsLoaded(userFriends: userFriends),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
    },
  );

  test(
    'should emit [UserFriendsLoading, UserFriendsError] when getting data fails',
    () {
      // arrange
      when(() => mockFetchUserFriends())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      bloc.add(FetchUserFriendsEvent());
      // assert later
      final expected = [
        UserFriendsLoading(),
        const UserFriendsError(message: serverFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
    },
  );
}
