import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_friends/modules/core/error/exceptions.dart';
import 'package:user_friends/modules/shared/data/datasources/user_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:user_friends/modules/shared/data/models/user_model.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late UserDatasource datasource;
  late MockClient mockClient;

  setUp(
    () {
      mockClient = MockClient();
      datasource = UserDatasourceImpl(client: mockClient);
      registerFallbackValue(Uri());
    },
  );

  group('fetchMainUser', () {
    late User user;

    setUp(
      () {
        user = UserModel.fromJson(json.decode(fixture('user.json')));
      },
    );

    test(
      'should perform a GET request on a URL with application/json header',
      () async {
        // arrange
        when(() => mockClient.get(any(), headers: any(named: "headers")))
            .thenAnswer((_) async => http.Response(fixture('user.json'), 200));
        // act
        datasource.fetchMainUser();
        // assert
        verify(() => mockClient.get(
              Uri.parse('https://randomuser.me/api'),
              headers: {'Content-Type': 'application/json'},
            ));
      },
    );

    test(
      'should return a User when the response code is 200',
      () async {
        // arrange
        when(() => mockClient.get(any(), headers: any(named: "headers")))
            .thenAnswer((_) async => http.Response(fixture('user.json'), 200));
        // act
        final result = await datasource.fetchMainUser();
        // assert
        expect(result, equals(user));
      },
    );

    test(
      'should throw ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(() => mockClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
                (_) async => http.Response('Something went wrong', 404));
        // act
        final call = datasource.fetchMainUser;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('fetchUserFriends', () {
    late List<User> userFriends;

    setUp(
      () {
        Iterable list = json.decode(fixture('user_friends.json'));
        userFriends =
            List<User>.from(list.map((model) => UserModel.fromJson(model)));
      },
    );

    test(
      'should perform a GET request on a URL with application/json header',
      () async {
        // arrange
        when(() => mockClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
                (_) async => http.Response(fixture('user_friends.json'), 200));
        // act
        datasource.fetchUserFriends();
        // assert
        verify(() => mockClient.get(
              Uri.parse('https://randomuser.me/api/?results=10'),
              headers: {'Content-Type': 'application/json'},
            ));
      },
    );

    test(
      'should return the user friends when the response code is 200',
      () async {
        // arrange
        when(() => mockClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
                (_) async => http.Response(fixture('user_friends.json'), 200));
        // act
        final result = await datasource.fetchUserFriends();
        // assert
        expect(result, equals(userFriends));
      },
    );

    test(
      'should throw ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(() => mockClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
                (_) async => http.Response('Something went wrong', 404));
        // act
        final call = datasource.fetchUserFriends;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
}
