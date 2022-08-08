import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:user_friends/modules/shared/data/models/user_model.dart';
import 'package:user_friends/modules/shared/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late UserModel userModel;

  setUp(
    () {
      userModel = const UserModel(
        photoUrl: 'photoUrl',
        email: 'email',
        name: 'name',
      );
    },
  );

  test(
    'should be a subclass of User',
    () {
      // assert
      expect(userModel, isA<User>());
    },
  );

  test(
    'should return a valid UserModel from the JSON',
    () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
      // act
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result, equals(userModel));
    },
  );
}
