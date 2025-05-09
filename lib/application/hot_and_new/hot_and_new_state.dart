part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyoneIsWatchingList,
    required bool isLoading,
    required bool hasErorr
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonList: [],
        everyoneIsWatchingList: [],
        isLoading: false,
        hasErorr: false
      );
}
