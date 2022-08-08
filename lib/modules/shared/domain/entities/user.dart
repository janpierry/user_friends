import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String photoUrl;
  final String name;
  final String email;

  const User({
    required this.photoUrl,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [photoUrl, name, email];
}
