part of 'ny_times_bloc.dart';

abstract class NyTimesState {
  const NyTimesState();
}

class NyTimesInitial extends NyTimesState {}

// --------------------Start Get Ny Times-------------------- //

// Loading Get Ny Times State
class LoadingGetNyTimesDataState extends NyTimesState {}

// Error On Getting Ny Times State
class ErrorGetNyTimesDataState extends NyTimesState {
  final String errorMsg;

  ErrorGetNyTimesDataState(this.errorMsg);
}

// Success Get Ny Times State
class SuccessGetNyTimesDataState extends NyTimesState {
  final List<NyTimesModel> nyTimesArticles;

  SuccessGetNyTimesDataState(this.nyTimesArticles);
}

// --------------------End NyTimes-------------------- //
