import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String posterPath;
  final String movieName;
  final String description;
  final String day;
  final String imgUrl;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.posterPath,
    required this.movieName,
    required this.description,
    required this.day,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(month,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
               Text(
                day,
                style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VideoWidget(imageUrl: imgUrl,),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   const Row(
                    children: [
                      CustomButtonWidget(
                          iconSize: 25,
                          textSize: 16,
                          text: 'Remind Me',
                          icon: Icons.notifications_outlined),
                      kWidth20,
                      CustomButtonWidget(
                          iconSize: 25,
                          textSize: 16,
                          text: 'Info',
                          icon: Icons.info_outline),
                      kWidth
                    ],
                  ),
                ],
              ),
               Text("Coming On $day $month"),
              kHeight,
               Text(
                movieName,
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
