import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makalam_homework/core/error/failure.dart';
import 'package:makalam_homework/feature/domain/entities/page_entity.dart';
import 'package:makalam_homework/feature/domain/usecases/get_all_articles.dart';

part 'page_load_events.dart';
part 'page_load_states.dart';

class PageLoadBloc extends Bloc<PageLoadEvent, PageLoadState> {
  final GetAllArticles getAllArticles;

  PageLoadBloc({required this.getAllArticles}) : super(PageEmpty()) {
    on<LoadPage>((event, emit) => _loadPage(emit, event.page));
  }

  void _loadPage(Emitter emit, int page) async {
    emit(PageLoading());
    final failureOrPage =
        await getAllArticles(GetAllArticlesParams(page: page));

    log(failureOrPage.toString());
    failureOrPage.fold(
      (Failure failure) => emit(
        PageLoadError(message: _mapFailureToMessage(failure)),
      ),
      (PageEntity page) => emit(PageLoaded(page: page)),
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure _:
      return "Server Failure";
    case CacheFailure _:
      return "Cache Failure";
    default:
      return "Unknown Error";
  }
}
