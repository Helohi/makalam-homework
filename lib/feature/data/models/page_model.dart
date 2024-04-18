import 'package:makalam_homework/feature/data/models/article_model.dart';
import 'package:makalam_homework/feature/domain/entities/page_entity.dart';

class PageModel extends PageEntity {
  const PageModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticalModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results,
    };
  }
}
