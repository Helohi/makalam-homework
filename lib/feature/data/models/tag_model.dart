import 'dart:convert';

import 'package:makalam_homework/feature/domain/entities/tag_entity.dart';

class TagModel extends TagEntity {
  const TagModel({
    required super.id,
    required super.slug,
    required super.name,
    required super.articleCount,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      slug: utf8.decode(json['slug'].codeUnits),
      name: utf8.decode(json['name'].codeUnits),
      articleCount: json['article_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'article_count': articleCount,
    };
  }
}
