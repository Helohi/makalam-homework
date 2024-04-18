import 'package:equatable/equatable.dart';
import 'package:makalam_homework/feature/domain/entities/artical_entity.dart';

class PageEntity extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<ArticalEntity> results;

  const PageEntity(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  @override
  List<Object?> get props => [count, next, previous, results];
}
