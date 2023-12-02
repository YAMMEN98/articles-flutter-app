part of 'articles_bloc.dart';

abstract class ArticlesEvent {
  const ArticlesEvent();
}

// On getting Ny times Event
class OnGettingArticlesEvent extends ArticlesEvent {
  final String text;
  final int period;
  final bool withLoading;

  OnGettingArticlesEvent(this.text, this.period,
      {this.withLoading = true});
}

// On searching Event
class OnSearchingArticlesEvent extends ArticlesEvent {
  final String text;

  OnSearchingArticlesEvent(
    this.text,
  );
}
