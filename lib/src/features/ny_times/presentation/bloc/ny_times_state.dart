part of 'ny_times_bloc.dart';

abstract class NyTimesState {
  const NyTimesState();
}

class NyTimesInitial extends NyTimesState {}

// --------------------Start Get Ny Times-------------------- //

// Loading Get Ny Times State
class LoadingDataState extends NyTimesState {}

// Error On Getting Ny Times State
class ErrorDataState extends NyTimesState {
  final String errorMsg;

  ErrorDataState(this.errorMsg);
}

// Success Get Ny Times State
class SuccessDataState extends NyTimesState {}

// --------------------End NyTimes-------------------- //
