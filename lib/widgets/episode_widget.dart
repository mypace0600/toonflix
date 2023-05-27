import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeWidget extends StatelessWidget {
  final String epId, title, rating, date, toonId;

  const EpisodeWidget({
    super.key,
    required this.title,
    required this.rating,
    required this.epId,
    required this.date,
    required this.toonId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Uri url = Uri.parse(
            "https://comic.naver.com/webtoon/detail?titleId=$toonId&no=$epId");
        launchUrl(url);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
        ),
      ),
    );
  }
}
