part of 'ny_times_articles_bloc.dart';

abstract class NyTimesArticlesEvent {
  const NyTimesArticlesEvent();
}

// On getting Ny times Event
class OnGettingNyTimesArticlesEvent extends NyTimesArticlesEvent {
  final String text;
  final int period;
  final bool withLoading;
  OnGettingNyTimesArticlesEvent(this.text,this.period, {this.withLoading = true});
}

// On searching Event
class OnSearchingArticlesEvent extends NyTimesArticlesEvent {
  final String text;

  OnSearchingArticlesEvent(this.text, );
}


