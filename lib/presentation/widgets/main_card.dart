import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key,required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      decoration: BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
