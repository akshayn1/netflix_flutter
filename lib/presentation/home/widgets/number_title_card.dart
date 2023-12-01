import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';
import 'package:netflix_app/presentation/widgets/number_card.dart';

import '../../../core/constants.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.postersList,
  });

  final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTitle(
          title: 'Top 10 TV Shows in India Today',
        ),
        kHeight,
        LimitedBox(
          maxHeight: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              postersList.length,
              (index) => NumberCard(
                index: index,
                url: postersList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
