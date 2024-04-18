part of "page_load_bloc.dart";

abstract class PageLoadEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPage extends PageLoadEvent {
  final int page;

  LoadPage({required this.page});

  @override
  List<Object?> get props => [page];
}
