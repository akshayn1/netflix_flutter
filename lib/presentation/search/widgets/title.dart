import 'package:flutter/material.dart';

class SearchTextTile extends StatelessWidget {
  final String title;
  const SearchTextTile({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
