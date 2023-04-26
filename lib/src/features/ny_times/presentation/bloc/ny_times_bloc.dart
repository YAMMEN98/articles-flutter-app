import 'package:bloc/bloc.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/constant/app_constants.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';

part 'ny_times_event.dart';

part 'ny_times_state.dart';

class NyTimesBloc extends Bloc<NyTimesEvent, NyTimesState> {
  late NyTimesUseCase nyTimesUseCase;

  // List of ny times articles
  List<NyTimesModel> allArticles = [];

  NyTimesBloc() : super(LoadingGetNyTimesDataState()) {
    nyTimesUseCase = sl<NyTimesUseCase>();

    on<OnGettingNyTimesEvent>(_onGettingNyTimesEvent);
    on<OnSearchingEvent>(_onSearchingEvent);
  }

  // Getting ny times event
  _onGettingNyTimesEvent(
      OnGettingNyTimesEvent event, Emitter<NyTimesState> emitter) async {
    if (event.withLoading) {
      emitter(LoadingGetNyTimesDataState());
    }

    final result = await nyTimesUseCase.call(
      NyTimesParams(
        period: event.period,
      ),
    );
    result.fold((l) {
      if (l is CancelTokenFailure) {
        emitter(LoadingGetNyTimesDataState());
      } else {
        emitter(ErrorGetNyTimesDataState(l.errorMessage));
      }
    }, (r) {
      // Return list of articles with filtered by search text
      allArticles = r;
      emitter(SuccessGetNyTimesDataState(_runFilter(event.text)));
    });
  }

  // Searching event
  _onSearchingEvent(
      OnSearchingEvent event, Emitter<NyTimesState> emitter) async {
    emitter(
      SearchingState(
        _runFilter(event.text),
      ),
    );
  }

  // This function is called whenever the text field changes
  List<NyTimesModel> _runFilter(
    String text,
  ) {
    List<NyTimesModel> results = [];
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = List.from(allArticles);
    } else {
      results = allArticles.where((user) {
        return (user.title ?? defaultStr)
            .toLowerCase()
            .contains(text.toLowerCase());
      }).toList();
    }
    return results;
  }
}
