import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/Domain/core/failures/main_failure.dart';

import '../../Domain/hot_and_new_resp/hot_and_new_service.dart';
import '../../Domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    /*
      get hot and new movie data
      */

    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchingList: [],
          isLoading: true,
          hasErorr: false));

      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewMovieData();
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
              comingSoonList: [],
              everyoneIsWatchingList: [],
              isLoading: false,
              hasErorr: true);
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: resp.results!,
            everyoneIsWatchingList: state.everyoneIsWatchingList,
            isLoading: false,
            hasErorr: false,
          );
        },
      );
      emit(newState);
    });

    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      emit(const HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchingList: [],
          isLoading: true,
          hasErorr: false));

      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewTVData();
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
              comingSoonList: [],
              everyoneIsWatchingList: [],
              isLoading: false,
              hasErorr: true);
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList:state.comingSoonList,
            everyoneIsWatchingList:  resp.results!,
            isLoading: false,
            hasErorr: false,
          );
        },
      );
      emit(newState);
    });
  }
}
