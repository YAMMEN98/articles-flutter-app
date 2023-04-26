part of 'ny_times_bloc.dart';

abstract class NyTimesState {
  const NyTimesState();
}

class NyTimesInitial extends NyTimesState {}

/// --------------------Start NyTimes-------------------- ///

/// Loading feature name state
class LoadingDataState extends NyTimesState {}

/// Error feature name state
class ErrorDataState extends NyTimesState {
  final String errorMsg;

  ErrorDataState(this.errorMsg);
}

/// Success feature name state
class SuccessDataState extends NyTimesState {}

/// --------------------End NyTimes-------------------- ///
