import 'package:flutter/material.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';
import 'package:ny_times_app/src/features/articles/presentation/bloc/articles_bloc.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  ArticlesBloc _bloc = ArticlesBloc(articlesUseCase: sl<ArticlesUseCase>());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _bloc.add(
                OnGettingArticlesEvent(
                  "You",
                  1,
                  withLoading: false,
                ),
              );
            },
            child: Text("Call Articles"),
          ),
        ],
      ),
    );
  }
}
