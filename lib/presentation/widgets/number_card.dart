import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    required this.index,
    required this.url,
    super.key,
  });
  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Row(
              children: [
                Container(
                  height: 250,
                  width: 30,
                ),
                MainCard(
                    imageUrl:
                        url),
              ],
            ),
            BorderedText(
              strokeWidth: 5,
              strokeColor: Colors.white,
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 140,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ));
  }
}
