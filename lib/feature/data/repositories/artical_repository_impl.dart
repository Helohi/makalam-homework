import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:makalam_homework/core/error/exception.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/core/platform/network_info.dart';
import 'package:makalam_homework/feature/data/datasources/page_local_data_source.dart';
import 'package:makalam_homework/feature/data/datasources/page_remote_data_source.dart';
import 'package:makalam_homework/feature/domain/entities/page_entity.dart';
import 'package:makalam_homework/feature/domain/repositories/artical_repository.dart';

class ArticalRepositoryImpl implements ArticalRepository {
  final PageRemoteDataSource remoteDataSource;
  final PageLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ArticalRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PageEntity>> getAllArticles(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePage = await remoteDataSource.getAllArticles(page);
        log(remotePage.toString());
        localDataSource.pageToCache(remotePage);
        return Right(remotePage);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPage = await localDataSource.getLastPageFromCache();
        return Right(localPage);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
