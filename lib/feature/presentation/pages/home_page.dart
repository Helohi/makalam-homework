import 'package:flutter/material.dart';
import 'package:makalam_homework/feature/presentation/widgets/list_articles.dart';
import 'package:makalam_homework/feature/presentation/widgets/logo_and_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MakalamLogoAndText(),
      ),
      body: const ListArticles(),
    );
  }
}
