import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/core/usecases/usecase.dart';
import 'package:makalam_homework/feature/domain/entities/page_entity.dart';
import 'package:makalam_homework/feature/domain/repositories/artical_repository.dart';

class GetAllArticles extends UseCase<PageEntity, GetAllArticlesParams> {
  final ArticalRepository articalRepository;

  GetAllArticles(this.articalRepository);

  @override
  Future<Either<Failure, PageEntity>> call(GetAllArticlesParams params) async {
    return await articalRepository.getAllArticles(params.page);
  }
}

class GetAllArticlesParams extends Equatable {
  final int page;

  const GetAllArticlesParams({required this.page});

  @override
  List<Object?> get props => [page];
}
