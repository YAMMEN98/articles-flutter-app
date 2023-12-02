part of 'articles_bloc.dart';

abstract class ArticlesState {
  const ArticlesState();
}

class NyTimesInitial extends ArticlesState {}

// --------------------Start Get Articles States-------------------- //

// Loading Get Ny Times State
class LoadingGetArticlesState extends ArticlesState {}

// Error On Getting Ny Times State
class ErrorGetArticlesState extends ArticlesState {
  final String errorMsg;

  ErrorGetArticlesState(this.errorMsg);
}

// Success Get Ny Times State
class SuccessGetArticlesState extends ArticlesState {
  final List<ArticleModel> articles;

  SuccessGetArticlesState(this.articles);
}

// --------------------End Get Articles States-------------------- //

// --------------------Start Searching States-------------------- //

class SearchingState extends ArticlesState {
  final List<ArticleModel> articles;

  SearchingState(this.articles);
}

// --------------------End Searching States-------------------- //
