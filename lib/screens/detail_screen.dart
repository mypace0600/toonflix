import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

import '../models/detail_model.dart';
import '../models/episode_model.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailModel> detail;
  late Future<List<EpisodeModel>> episodeList;
  @override
  void initState() {
    super.initState();
    detail = ApiService.getDetail(widget.id);
    episodeList = ApiService.getEpisodeListById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(1),
                        )
                      ]),
                  width: 250,
                  child: Image.network(
                    widget.thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          FutureBuilder(
            future: detail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${snapshot.data!.genre}  /  ${snapshot.data!.age}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Text("...");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: episodeList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: makeList(snapshot),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<EpisodeModel>> snapshot) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var episode = snapshot.data![index];
        return EpisodeWidget(
          title: episode.title,
          rating: episode.rating,
          id: episode.id,
          date: episode.date,
        );
      },
    );
  }
}
