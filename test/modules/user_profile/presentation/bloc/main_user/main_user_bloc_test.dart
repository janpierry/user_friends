import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_friends/modules/core/error/failures.dart';
import 'package:user_friends/modules/core/utils/consts.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';
import 'package:user_friends/modules/user_profile/domain/usecases/fetch_main_user.dart';
import 'package:user_friends/modules/user_profile/presentation/bloc/main_user/main_user_bloc.dart';

class MockFetchMainUser extends Mock implements FetchMainUser {}

void main() {
  late MainUserBloc bloc;
  late MockFetchMainUser mockFetchMainUser;
  late User user;

  setUp(
    () {
      mockFetchMainUser = MockFetchMainUser();
      bloc = MainUserBloc(fetchMainUser: mockFetchMainUser);
      user = const User(photoUrl: 'photoUrl', name: 'name', email: 'email');
    },
  );

  test(
    'initial state should be [MainUserInitial]',
    () {
      // assert
      expect(bloc.state, MainUserInitial());
    },
  );

  test(
    'should get the main user from the FetchMainUser usecase',
    () async {
      // arrange
      when(() => mockFetchMainUser()).thenAnswer((_) async => Right(user));
      // act
      bloc.add(FetchMainUserEvent());
      await untilCalled(() => mockFetchMainUser());
      // assert
      verify(() => mockFetchMainUser());
    },
  );

  test(
    'should emit [MainUserLoading, MainUserLoaded] when data is gotten successfully',
    () {
      // arrange
      when(() => mockFetchMainUser()).thenAnswer((_) async => Right(user));
      // act
      bloc.add(FetchMainUserEvent());
      // assert later
      final expected = [
        MainUserLoading(),
        MainUserLoaded(user: user),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
    },
  );

  test(
    'should emit [MainUserLoading, MainUserError] when getting data fails',
    () {
      // arrange
      when(() => mockFetchMainUser())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      bloc.add(FetchMainUserEvent());
      // assert later
      final expected = [
        MainUserLoading(),
        const MainUserError(message: serverFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
    },
  );
}
