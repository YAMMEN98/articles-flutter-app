import 'package:ny_times_app/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:flutter/material.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/widgets/custom_app_bar_widget.dart';
import 'package:ny_times_app/src/core/translations/l10n.dart';
import 'package:ny_times_app/src/core/util/helper.dart';
import 'package:ny_times_app/src/features/ny_times/presentation/bloc/ny_times_bloc.dart';
import 'package:ny_times_app/src/features/ny_times/presentation/widgets/article_card_widget.dart';

class NyTimesPage extends StatefulWidget {
  const NyTimesPage({Key? key}) : super(key: key);

  @override
  State<NyTimesPage> createState() => _NyTimesPageState();
}

class _NyTimesPageState extends State<NyTimesPage> {
  NyTimesBloc _bloc = NyTimesBloc();

  @override
  void initState() {
    _bloc.add(OnGettingNyTimesEvent(7));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Column(
        children: [
          // Custom App Bar
          CustomAppBarWidget(
            title: Text(
              S.of(context).ny_times_most_popular,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 20,
              ),
            ),
            actions: [
              // Search
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),

              // Menu
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 20,
                ),
              ),
            ],
          ),

          // Space
          SizedBox(
            height: Helper.getVerticalSpace(),
          ),


          // List of articles
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ArticleCardWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
