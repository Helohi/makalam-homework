import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/core/usecases/usecase.dart';
import 'package:makalam_homework/feature/domain/entities/user_entity.dart';
import 'package:makalam_homework/feature/domain/repositories/user_repository.dart';

class Login extends UseCase<UserEntity, LoginParams> {
  final UserRepository userRepository;

  Login(this.userRepository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await userRepository.login(params.userName, params.password);
  }
}

class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
