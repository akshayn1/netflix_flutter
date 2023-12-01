import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/custom_button_widget.dart';

import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(kMainImage))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                text: 'My List',
                icon: Icons.add,
              ),
              _playButton(),
              const CustomButtonWidget(
                text: 'Info',
                icon: Icons.info_outline,
              ),
            ],
          ),
        )
      ],
    );
  }
  TextButton _playButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kBlackColor,
        size: 30,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Text(
          "Play",
          style: TextStyle(color: kBlackColor, fontSize: 20),
        ),
      ),
    );
  }
}
