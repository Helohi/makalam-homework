import 'package:flutter/material.dart';
import 'package:makalam_homework/feature/domain/entities/tag_entity.dart';

class ShowTags extends StatelessWidget {
  const ShowTags({super.key, required this.tags});

  final List<TagEntity> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: [
        ...tags.map(
          (e) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              e.name
                  .split(' ')
                  .map((e) => "${e[0].toUpperCase()}${e.substring(1)}")
                  .join(' '),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
