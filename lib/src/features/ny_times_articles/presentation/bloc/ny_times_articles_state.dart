part of 'ny_times_articles_bloc.dart';

abstract class NyTimesArticlesState {
  const NyTimesArticlesState();
}

class NyTimesInitial extends NyTimesArticlesState {}

// --------------------Start Get Ny Times States-------------------- //

// Loading Get Ny Times State
class LoadingGetNyTimesArticlesState extends NyTimesArticlesState {}

// Error On Getting Ny Times State
class ErrorGetNyTimesArticlesState extends NyTimesArticlesState {
  final String errorMsg;

  ErrorGetNyTimesArticlesState(this.errorMsg);
}

// Success Get Ny Times State
class SuccessGetNyTimesArticlesState extends NyTimesArticlesState {
  final List<NyTimesArticlesModel> nyTimesArticles;

  SuccessGetNyTimesArticlesState(this.nyTimesArticles);
}

// --------------------End NyTimes States-------------------- //

// --------------------Start Searching States-------------------- //

class SearchingState extends NyTimesArticlesState {
  final List<NyTimesArticlesModel> nyTimesArticles;

  SearchingState(this.nyTimesArticles);
}

// --------------------End Searching States-------------------- //
