import 'package:flutter/material.dart';

class MakalamLogoAndText extends StatelessWidget {
  const MakalamLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset("assets/makalam_icon.png"),
        const Text('Makalam'),
      ],
    );
  }
}
