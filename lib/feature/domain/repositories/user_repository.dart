import 'package:dartz/dartz.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login(String userName, String password);
}
