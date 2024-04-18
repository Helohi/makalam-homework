import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userName;
  final String token;

  const UserEntity({required this.userName, required this.token});

  @override
  List<Object?> get props => [userName, token];
}
