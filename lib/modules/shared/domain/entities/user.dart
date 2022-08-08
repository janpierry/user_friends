import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String urlPhoto;
  final String name;
  final String email;

  const User({
    required this.urlPhoto,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [urlPhoto, name, email];
}
