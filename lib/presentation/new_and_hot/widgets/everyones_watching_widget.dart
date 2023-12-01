import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
         movieName,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
         Text(
           description),
        kHeight50,
         VideoWidget(imageUrl: posterPath,),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 100,
              color: Colors.black,
            ),
            const Row(
              children: [
                CustomButtonWidget(
                  text: 'Share',
                  icon: Icons.share,
                  iconSize: 25,
                  textSize: 12,
                ),
                kWidth,
                CustomButtonWidget(
                  text: 'My List',
                  icon: Icons.add,
                  iconSize: 25,
                  textSize: 12,
                ),
                kWidth,
                CustomButtonWidget(
                  text: 'Play',
                  icon: Icons.play_arrow,
                  iconSize: 25,
                  textSize: 12,
                ),
                kWidth
              ],
            ),
          ],
        )
      ],
    );
  }
}
