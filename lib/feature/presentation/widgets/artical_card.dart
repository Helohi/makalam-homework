import 'package:flutter/material.dart';
import 'package:makalam_homework/feature/domain/entities/artical_entity.dart';
import 'package:makalam_homework/feature/presentation/widgets/show_stats.dart';
import 'package:makalam_homework/feature/presentation/widgets/show_tags.dart';

class ArticalCard extends StatelessWidget {
  const ArticalCard({super.key, required this.artical});

  final ArticalEntity artical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(artical.author.avatar),
                        maxRadius: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${artical.author.firstName} ${artical.author.lastName}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('@${artical.author.userName}'),
                      const SizedBox(height: 8),
                      Text(artical.publishedDateHumanized),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _timeTakes(),
            ],
          ),
          const SizedBox(height: 8),
          if (artical.banner.isNotEmpty) _banner(),
          const SizedBox(height: 8),
          Text(
            artical.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            artical.content.length < 160
                ? artical.content
                : "${artical.content.substring(0, 160)}...",
          ),
          const SizedBox(height: 16),
          ShowTags(tags: artical.tags),
          const SizedBox(height: 8),
          ShowStats(artical: artical),
        ],
      ),
    );
  }

  Widget _timeTakes() {
    return Row(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        child: Row(
          children: [
            const Icon(
              Icons.hourglass_empty_rounded,
              color: Colors.black,
            ),
            Text(
              "${artical.readTime} minut alar",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _banner() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(artical.banner),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
