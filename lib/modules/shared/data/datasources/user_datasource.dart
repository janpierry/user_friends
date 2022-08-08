import 'dart:convert';

import 'package:user_friends/modules/core/error/exceptions.dart';
import 'package:user_friends/modules/shared/data/models/user_model.dart';

import '../../domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class UserDatasource {
  Future<User> fetchMainUser();
  Future<List<User>> fetchUserFriends();
}

class UserDatasourceImpl implements UserDatasource {
  final http.Client client;

  UserDatasourceImpl({required this.client});

  @override
  Future<User> fetchMainUser() async {
    final response = await client.get(
      Uri.parse('https://randomuser.me/api'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    return UserModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<User>> fetchUserFriends() async {
    final response = await client.get(
      Uri.parse('https://randomuser.me/api/?results=10'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    Iterable list = json.decode(response.body);
    List<User> userFriends =
        List<User>.from(list.map((model) => UserModel.fromJson(model)));
    return userFriends;
  }
}
