part of 'ny_times_bloc.dart';

abstract class NyTimesEvent {
  const NyTimesEvent();
}

// On getting Ny times Event
class OnGettingNyTimesEvent extends NyTimesEvent {
  final String text;
  final int period;
  final bool withLoading;
  OnGettingNyTimesEvent(this.text,this.period, {this.withLoading = true});
}

// On searching Event
class OnSearchingEvent extends NyTimesEvent {
  final String text;

  OnSearchingEvent(this.text, );
}


