import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final int id;
  final String slug;
  final String name;
  final int? articleCount;

  const TagEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.articleCount,
  });

  @override
  List<Object?> get props => [id, slug, name, articleCount];
}
