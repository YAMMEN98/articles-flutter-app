part of 'ny_times_bloc.dart';

abstract class NyTimesEvent {
  const NyTimesEvent();
}

/// On getting Ny times Event
class OnGettingNyTimesEvent extends NyTimesEvent {
  final int period;

  OnGettingNyTimesEvent(this.period);
}
