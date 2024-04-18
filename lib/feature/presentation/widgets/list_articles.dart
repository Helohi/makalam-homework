import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makalam_homework/feature/domain/entities/artical_entity.dart';
import 'package:makalam_homework/feature/presentation/bloc/page_load_bloc/page_load_bloc.dart';
import 'package:makalam_homework/feature/presentation/widgets/artical_card.dart';

class ListArticles extends StatelessWidget {
  const ListArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageLoadBloc, PageLoadState>(
      bloc: BlocProvider.of<PageLoadBloc>(context),
      builder: (context, state) {
        List<ArticalEntity> articals = [];
        switch (state.runtimeType) {
          case const (PageEmpty):
          case const (PageLoaded):
            if (state is PageLoaded) articals = state.page.results;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ArticalCard(artical: articals[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: articals.length,
            );
          case const (PageLoading):
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return Text("Unhandled State: ${state.runtimeType}");
        }
      },
    );
  }
}
