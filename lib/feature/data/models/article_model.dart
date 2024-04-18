import 'dart:convert';

import 'package:makalam_homework/feature/data/models/author_model.dart';
import 'package:makalam_homework/feature/data/models/tag_model.dart';
import 'package:makalam_homework/feature/domain/entities/artical_entity.dart';

class ArticalModel extends ArticalEntity {
  const ArticalModel({
    required super.id,
    required super.slug,
    required super.url,
    required super.author,
    required super.title,
    required super.banner,
    required super.content,
    required super.tags,
    required super.status,
    required super.readTime,
    required super.viewCount,
    required super.commentCount,
    required super.likeCount,
    required super.isLiked,
    required super.publishedDate,
    required super.publishedDateHumanized,
  });

  factory ArticalModel.fromJson(Map<String, dynamic> json) {
    return ArticalModel(
      id: json['id'],
      slug: utf8.decode(json['slug'].codeUnits),
      url: utf8.decode(json['url'].codeUnits),
      author: AuthorModel.fromJson(json['author']),
      title: utf8.decode(json['title'].codeUnits),
      banner: utf8.decode(json['banner'].codeUnits),
      content: utf8.decode(json['content'].codeUnits),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagModel.fromJson(e))
          .toList(),
      status: json['status'],
      readTime: json['read_time'],
      viewCount: json['view_count'],
      commentCount: json['comment_count'],
      likeCount: json['like_count'],
      isLiked: json['is_liked'],
      publishedDate: DateTime.parse(json['published_date']),
      publishedDateHumanized:
          utf8.decode(json['published_date_humanized'].codeUnits),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'url': url,
      'author': author, // TODO: Author.toJson()?
      'title': title,
      'banner': banner,
      'content': content,
      'tags': tags, // TODO: tags.toJson()?
      'status': status,
      'read_time': readTime,
      'view_count': viewCount,
      'comment_count': commentCount,
      'like_count': likeCount,
      'is_liked': isLiked,
      'published_date': publishedDate.toIso8601String(),
      'published_date_humanized': publishedDateHumanized,
    };
  }
}
