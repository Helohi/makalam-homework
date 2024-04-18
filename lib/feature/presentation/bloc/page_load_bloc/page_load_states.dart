part of "page_load_bloc.dart";

abstract class PageLoadState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PageEmpty extends PageLoadState {}

class PageLoading extends PageLoadState {}

class PageLoaded extends PageLoadState {
  final PageEntity page;

  PageLoaded({required this.page});

  @override
  List<Object?> get props => [page];
}

class PageLoadError extends PageLoadState {
  final String message;

  PageLoadError({required this.message});
}
