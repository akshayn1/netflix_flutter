part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {
        required String stateId,
      required List<HotAndNewData> psYearMovieList,
      required List<HotAndNewData> trendingNowMovieList,
      required List<HotAndNewData> tenseDramasMovieList,
      required List<HotAndNewData> southIndianMovieList,
      required List<HotAndNewData> trendingTvList,
      required bool isLoading,
      required bool hasError}) = _Initial;

  factory HomeState.initial() => const HomeState(
    stateId: '0',
        psYearMovieList: [],
        trendingNowMovieList: [],
        tenseDramasMovieList: [],
        southIndianMovieList: [],
        trendingTvList: [],
        isLoading: false,
        hasError: false,
      );
}
