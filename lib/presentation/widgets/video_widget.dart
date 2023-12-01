import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class VideoWidget extends StatelessWidget {
  final String imageUrl;
  const VideoWidget({
    super.key,
    this.imageUrl = newAndHotTempImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(imageUrl, fit: BoxFit.cover, loadingBuilder:
              (BuildContext _, Widget child, ImageChunkEvent? progress) {
            if (progress == null) {
              return child;
            } else {
              return const Center(child: CircularProgressIndicator(strokeWidth: 2,));
            }
          }, errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
            return const Center(child: Icon(Icons.signal_wifi_connected_no_internet_4,color: Colors.white,));
          }),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black.withOpacity(0.4),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.volume_off,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
