import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/detail_model.dart';
import 'package:toonflix/models/episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<DetailModel> getDetail(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final detail = jsonDecode(response.body);
      return DetailModel.fromJson(detail);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getEpisodeListById(String id) async {
    List<EpisodeModel> episodeInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episoeds = jsonDecode(response.body);
      for (var episoed in episoeds) {
        final toon = EpisodeModel.fromJson(episoed);
        episodeInstances.add(toon);
      }
      return episodeInstances;
    }
    throw Error();
  }
}
