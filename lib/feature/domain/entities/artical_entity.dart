import 'package:equatable/equatable.dart';
import 'package:makalam_homework/feature/domain/entities/author_entity.dart';
import 'package:makalam_homework/feature/domain/entities/tag_entity.dart';

class ArticalEntity extends Equatable {
  final int id;
  final String slug;
  final String url;
  final AuthorEntity author;
  final String title;
  final String banner;
  final String content;
  final List<TagEntity> tags;
  final String status;
  final int readTime;
  final int viewCount;
  final int commentCount;
  final int likeCount;
  final bool isLiked;
  final DateTime publishedDate;
  final String publishedDateHumanized;

  const ArticalEntity({
    required this.id,
    required this.slug,
    required this.url,
    required this.author,
    required this.title,
    required this.banner,
    required this.content,
    required this.tags,
    required this.status,
    required this.readTime,
    required this.viewCount,
    required this.commentCount,
    required this.likeCount,
    required this.isLiked,
    required this.publishedDate,
    required this.publishedDateHumanized,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        url,
        author,
        title,
        banner,
        content,
        tags,
        status,
        readTime,
        viewCount,
        commentCount,
        likeCount,
        isLiked,
        publishedDate,
        publishedDateHumanized,
      ];
}
