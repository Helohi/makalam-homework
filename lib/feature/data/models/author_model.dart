import 'dart:convert';

import 'package:makalam_homework/feature/domain/entities/author_entity.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel({
    required super.id,
    required super.userName,
    required super.avatar,
    required super.firstName,
    required super.lastName,
    required super.isFollowing,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      userName: utf8.decode(json['username'].codeUnits),
      avatar: json['avatar'],
      firstName: utf8.decode(json['first_name'].codeUnits),
      lastName: utf8.decode(json['last_name'].codeUnits),
      isFollowing: json['is_following'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': userName,
      'avatar': avatar,
      'first_name': firstName,
      'last_name': lastName,
      'is_following': isFollowing,
    };
  }
}
