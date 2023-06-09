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
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/presentation/bloc/ny_times_articles_bloc.dart';
import 'package:ny_times_app/src/features/ny_times_articles/presentation/widgets/article_card_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NyTimesArticlesPage extends StatefulWidget {
  const NyTimesArticlesPage({Key? key}) : super(key: key);

  @override
  State<NyTimesArticlesPage> createState() => _NyTimesArticlesPageState();
}

class _NyTimesArticlesPageState extends State<NyTimesArticlesPage> {
  NyTimesArticlesBloc _bloc = NyTimesArticlesBloc();

  // Key for scaffold to open drawer
  GlobalKey<ScaffoldState> _key = GlobalKey();

  // Refresh controller for list view
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool isSearching = false;

  // List of articles
  List<NyTimesArticlesModel> nyTimesArticles = [];

  // Search text field
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  // Period
  int selectedPeriod = 1;

  @override
  void initState() {
    // Call event to get ny times article
    callArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      scaffoldKey: _key,
      withDrawer: true,
      child: Column(
        children: [
          // Custom App Bar
          CustomAppBarWidget(
            title: isSearching
                ? TextFieldWidget(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    hintText: S.of(context).search,
                    onChanged: (value) {
                      _bloc.add(
                        OnSearchingArticlesEvent(
                          (value?.trim() ?? ""),
                        ),
                      );
                    },
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                          if (isSearching) {
                            _searchFocusNode.requestFocus();
                          } else {
                            _searchFocusNode.unfocus();
                            _searchController.clear();
                            callArticles();
                          }
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  )
                : Text(
                    S.of(context).ny_times_most_popular,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
            leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _key.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 20,
              ),
            ),
            actions: [
              // Search
              if (!isSearching) ...{
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                      if (isSearching) {
                        _searchFocusNode.requestFocus();
                      } else {
                        _searchFocusNode.unfocus();
                        _searchController.clear();
                        callArticles();
                      }
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
              },

              // Menu
              PopupMenuButton(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                child: Row(
                  children: [
                    Text(
                      S.of(context).period,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: 1.sp,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                    ),
                  ],
                ),
                onSelected: (value) {
                  selectedPeriod = int.tryParse(value) ?? 1;
                  callArticles();
                },
                elevation: 3,
                tooltip: S.of(context).period,
                itemBuilder: (BuildContext bc) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (selectedPeriod == 1) ...{
                            Icon(
                              Icons.check,
                              color: Theme.of(context).iconTheme.color,
                              size: 20,
                            ),
                          }
                        ],
                      ),
                      value: '1',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "7",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (selectedPeriod == 7) ...{
                            Icon(
                              Icons.check,
                              color: Theme.of(context).iconTheme.color,
                              size: 20,
                            ),
                          }
                        ],
                      ),
                      value: '7',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "30",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (selectedPeriod == 30) ...{
                            Icon(
                              Icons.check,
                              color: Theme.of(context).iconTheme.color,
                              size: 20,
                            ),
                          }
                        ],
                      ),
                      value: '30',
                    )
                  ];
                },
              ),
            ],
          ),

          // Space
          SizedBox(
            height: Helper.getVerticalSpace(),
          ),

          // List of articles
          Expanded(
            child: BlocConsumer<NyTimesArticlesBloc, NyTimesArticlesState>(
              bloc: _bloc,
              listener: (context, state) {
                if (state is SuccessGetNyTimesArticlesState) {
                  nyTimesArticles.clear();
                  nyTimesArticles = List.from(state.nyTimesArticles);
                  _refreshController.refreshCompleted(
                    resetFooterState: true,
                  );
                } else if (state is SearchingState) {
                  nyTimesArticles.clear();
                  nyTimesArticles = state.nyTimesArticles;
                }
              },
              builder: (context, state) {
                if (state is LoadingGetNyTimesArticlesState) {
                  return const AppLoader();
                } else if (state is ErrorGetNyTimesArticlesState) {
                  return ReloadWidget.error(
                    content: state.errorMsg,
                    onPressed: () {
                      callArticles();
                    },
                  );
                }

                // Check if there is no data
                if (nyTimesArticles.isEmpty) {
                  return ReloadWidget.empty(content: S.of(context).no_data);
                }

                return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: false,
                    header: WaterDropHeader(
                      waterDropColor: Theme.of(context).cardColor,
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: null,
                    child: ListView.builder(
                      itemCount: nyTimesArticles.length,
                      itemBuilder: (context, index) {
                        return ArticleCardWidget(
                          nyTimesModel: nyTimesArticles[index],
                        );
                      },
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

  // Refresh method called when pull down list
  void _onRefresh() async {
    _refreshController.requestRefresh();
    callArticles(withLoading: false);
  }

  // Call articles
  callArticles({bool withLoading = true}) {
    _bloc.add(
      OnGettingNyTimesArticlesEvent(
        _searchController.text.trim(),
        selectedPeriod,
        withLoading: withLoading,
      ),
    );
  }
}
