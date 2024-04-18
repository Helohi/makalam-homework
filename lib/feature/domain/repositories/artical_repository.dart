import 'package:dartz/dartz.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/feature/domain/entities/page_entity.dart';

abstract class ArticalRepository {
  Future<Either<Failure, PageEntity>> getAllArticles(int page);
}
