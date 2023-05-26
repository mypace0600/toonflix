import 'package:flutter/material.dart';

class EpisodeWidget extends StatelessWidget {
  final String id, title, rating, date;

  const EpisodeWidget({
    super.key,
    required this.title,
    required this.rating,
    required this.id,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '$rating / $date',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
