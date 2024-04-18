import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final int id;
  final String userName;
  final String avatar;
  final String firstName;
  final String lastName;
  final bool? isFollowing;

  const AuthorEntity({
    required this.id,
    required this.userName,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.isFollowing,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        avatar,
        firstName,
        lastName,
        isFollowing,
      ];
}
