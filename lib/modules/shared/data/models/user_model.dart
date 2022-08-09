import 'package:user_friends/modules/shared/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.photoUrl,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      photoUrl: json['picture']['large'],
      name: _buildFullName(json['name']),
      email: json['email'],
    );
  }

  static String _buildFullName(Map<String, dynamic> jsonName) {
    return '${jsonName['first']} ${jsonName['last']}';
  }
}
