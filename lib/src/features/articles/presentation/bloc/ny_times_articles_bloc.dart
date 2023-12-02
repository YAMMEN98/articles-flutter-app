import 'package:bloc/bloc.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/constant/app_constants.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';

part 'ny_times_articles_event.dart';
part 'ny_times_articles_state.dart';

class NyTimesArticlesBloc
    extends Bloc<NyTimesArticlesEvent, NyTimesArticlesState> {
  late ArticlesUseCase nyTimesUseCase;

  // List of ny times articles
  List<ArticleModel> allArticles = [];

  NyTimesArticlesBloc() : super(LoadingGetNyTimesArticlesState()) {
    nyTimesUseCase = sl<ArticlesUseCase>();

    on<OnGettingNyTimesArticlesEvent>(_onGettingNyTimesEvent);
    on<OnSearchingArticlesEvent>(_onSearchingEvent);
  }

  // Getting ny times event
  _onGettingNyTimesEvent(OnGettingNyTimesArticlesEvent event,
      Emitter<NyTimesArticlesState> emitter) async {
    if (event.withLoading) {
      emitter(LoadingGetNyTimesArticlesState());
    }

    final result = await nyTimesUseCase.call(
      ArticlesParams(
        period: event.period,
      ),
    );
    result.fold((l) {
      if (l is CancelTokenFailure) {
        emitter(LoadingGetNyTimesArticlesState());
      } else {
        emitter(ErrorGetNyTimesArticlesState(l.errorMessage));
      }
    }, (r) {
      // Return list of articles with filtered by search text
      allArticles = r;
      emitter(SuccessGetNyTimesArticlesState(_runFilter(event.text)));
    });
  }

  // Searching event
  _onSearchingEvent(OnSearchingArticlesEvent event,
      Emitter<NyTimesArticlesState> emitter) async {
    emitter(
      SearchingState(
        _runFilter(event.text),
      ),
    );
  }

  // This function is called whenever the text field changes
  List<ArticleModel> _runFilter(
    String text,
  ) {
    List<ArticleModel> results = [];
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = List.from(allArticles);
    } else {
      results = allArticles.where((user) {
        return (user.title ?? defaultStr)
            .toLowerCase()
            .contains(text.toLowerCase());
      }).toList();
    }
    return results;
  }
}
