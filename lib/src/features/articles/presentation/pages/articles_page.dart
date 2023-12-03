import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/widgets/custom_app_bar_widget.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/widgets/reload_widget.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:ny_times_app/src/core/translations/l10n.dart';
import 'package:ny_times_app/src/core/util/helper.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';
import 'package:ny_times_app/src/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:ny_times_app/src/features/articles/presentation/widgets/article_card_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
