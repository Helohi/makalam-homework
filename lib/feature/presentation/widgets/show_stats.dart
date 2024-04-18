import 'package:flutter/material.dart';
import 'package:makalam_homework/feature/domain/entities/artical_entity.dart';

class ShowStats extends StatelessWidget {
  const ShowStats({super.key, required this.artical});

  final ArticalEntity artical;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        smallIcon(Icons.remove_red_eye),
        const SizedBox(width: 5),
        Text(artical.viewCount.toString()),
        const SizedBox(width: 10),
        artical.isLiked
            ? smallIcon(Icons.thumb_up, color: Colors.red)
            : smallIcon(Icons.thumb_up_outlined, color: Colors.red),
        const SizedBox(width: 5),
        Text(artical.likeCount.toString()),
        const SizedBox(width: 10),
        smallIcon(Icons.comment),
        const SizedBox(width: 5),
        Text(artical.commentCount.toString()),
      ],
    );
  }

  Widget smallIcon(IconData icon, {Color? color}) {
    return Icon(
      icon,
      size: 20,
      color: color,
    );
  }
}
