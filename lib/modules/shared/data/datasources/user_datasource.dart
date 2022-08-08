import '../../domain/entities/user.dart';

abstract class UserDatasource {
  Future<User> fetchMainUser();
  Future<List<User>> fetchUserFriends();
}
