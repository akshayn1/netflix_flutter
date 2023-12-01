import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/background_card.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';
import 'package:netflix_app/presentation/widgets/number_card.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: ScrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              ScrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              ScrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.hasError) {
                    return const Center(
                      child: Text(
                        "Error While Getting Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  //realeased past year
                  final _releasesPastYear = state.psYearMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _releasesPastYear.shuffle();
                  //trending
                  final _trending = state.trendingNowMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _trending.shuffle();
                  //tense dramas
                  final _tense_dramas = state.tenseDramasMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _tense_dramas.shuffle();
                  //south indian
                  final _south_indian = state.southIndianMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _south_indian.shuffle();

                  //top 10 tv shows
                  final _top10TvShow = state.trendingTvList.map((t) {
                    return '$imageAppendUrl${t.posterPath}';
                  }).toList();
                  _top10TvShow.shuffle();

                  print(state.trendingTvList.length);
                  return ListView(
                    children: [
                      const BackgroundCard(),
                      MainTitleCard(
                        title: 'Released in the Past Year',
                        posterList: _releasesPastYear.sublist(0, 10),
                      ),
                      MainTitleCard(
                        title: 'Trending Now',
                        posterList: _trending.sublist(0, 10),
                      ),
                      NumberTitleCard(
                        postersList: _top10TvShow.sublist(0, 10),
                      ),
                      MainTitleCard(
                        title: 'Tense Dramas',
                        posterList: _tense_dramas.sublist(0, 10),
                      ),
                      MainTitleCard(
                        title: 'South Indian Cinema',
                        posterList: _south_indian.sublist(0, 10),
                      ),
                    ],
                  );
                },
              ),
              ScrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 10000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Image(
                                  image: NetworkImage(
                                      'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png'),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cast,
                                  color: kWhiteColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.emoji_people,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TV Shows",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Movies",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
    ));
  }
}
