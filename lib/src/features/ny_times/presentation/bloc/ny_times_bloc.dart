import 'package:bloc/bloc.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';

part 'ny_times_event.dart';

part 'ny_times_state.dart';

class NyTimesBloc extends Bloc<NyTimesEvent, NyTimesState> {
  late NyTimesUseCase nyTimesUseCase;

  NyTimesBloc() : super(NyTimesInitial()) {
    nyTimesUseCase = sl<NyTimesUseCase>();

    on<OnGettingNyTimesEvent>(_onLoggingIn);
  }

  /// NyTimes event
  _onLoggingIn(
      OnGettingNyTimesEvent event, Emitter<NyTimesState> emitter) async {
    emitter(LoadingDataState());
    final result = await nyTimesUseCase.call(
      NyTimesParams(
        period: event.period,
      ),
    );
    result.fold((l) {
      emitter(ErrorDataState(l.errorMessage));
    }, (r) {
      emitter(SuccessDataState());
    });
  }
}
