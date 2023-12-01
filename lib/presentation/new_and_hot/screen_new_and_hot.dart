import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kWidth
            ],
            bottom: TabBar(
                isScrollable: true,
                indicator:
                    BoxDecoration(color: kWhiteColor, borderRadius: kRadius30),
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlackColor,
                labelStyle:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: '🍿Coming soon',
                  ),
                  Tab(
                    text: "👀Everyone's watching",
                  )
                ]),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(
              key: Key('comingsoon'),
            ),
            EveryoneIsWatchingList(
              key: Key('everyones_watching_list'),
            )
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });

    return RefreshIndicator(
      onRefresh: ()async{
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasErorr) {
            return const Center(
              child: Text("Error While loading coming soon list"),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text("Comingsoon list is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top:20),
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.firstAirDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(_date!);
                  
    
                  month =
                      formatedDate.split(' ').first.substring(0, 3).toUpperCase();
    
                  date = movie.firstAirDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }
    
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  description: movie.overview ?? 'No descripition',
                  day: date,
                  imgUrl: '$imageAppendUrl${movie.posterPath}',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
       onRefresh: ()async{
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasErorr) {
            return const Center(
              child: Text("Error While loading coming soon list"),
            );
          } else if (state.everyoneIsWatchingList.isEmpty) {
            
            return const Center(
              child: Text("EveryOnesWatching list is empty"),
            );
          } else {
           
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.everyoneIsWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyoneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
               
                final tv = state.everyoneIsWatchingList[index];
    
                return EveryonesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalName ?? "no title",
                  description: tv.overview ?? "No decription",
                );
              },
            );
          }
        },
      ),
    );
  }
}
