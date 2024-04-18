import 'package:dartz/dartz.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/feature/domain/entities/user_entity.dart';
import 'package:makalam_homework/feature/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, UserEntity>> login(String userName, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
