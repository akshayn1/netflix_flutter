import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/core/failures/main_failure.dart';
import '../../Domain/hot_and_new_resp/hot_and_new_service.dart';
import '../../Domain/hot_and_new_resp/model/hot_and_new_resp.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    /* on event get homescreen data*/

    on<GetHomeScreenData>((event, emit) async {
      log('GETTING HOME SCREEN DATA');
      //send loading to UI

      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTVData();

      //transform data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            psYearMovieList: [],
            trendingNowMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;

          pastYear?.shuffle();
          trending?.shuffle();
          dramas?.shuffle();
          southIndian?.shuffle();
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            psYearMovieList: pastYear!,
            trendingNowMovieList: trending!,
            tenseDramasMovieList: dramas!,
            southIndianMovieList: southIndian!,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);
      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            psYearMovieList: [],
            trendingNowMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final to10List = resp.results;
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            psYearMovieList: state.psYearMovieList,
            trendingNowMovieList: state.trendingNowMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: to10List!,
            isLoading: false,
            hasError: false,
          );
        },
      );

      //send to ui
      emit(_state2);
    });
  }
}
