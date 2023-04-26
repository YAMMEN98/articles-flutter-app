part of 'ny_times_bloc.dart';

abstract class NyTimesEvent {
  const NyTimesEvent();
}

/// NyTimes event
class OnRequestingNyTimesEvent extends NyTimesEvent {
}

