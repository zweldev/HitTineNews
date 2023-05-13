import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sunray_news/app/core/contant/constants.dart';
import 'package:sunray_news/app/model/news_model.dart';

class APIService {
  APIService._();
  static APIService get instance => APIService._();

  Future<void> getData() async {
    http.Response r = await http.get(Uri.parse(Base_url));
    if (r.statusCode == 200) {
      var jsonResponse = r.body;
    }
  }

  Future<List<NewsModel>> getNews({
    String? category,
    String? country,
  }) async {
    http.Response r = await http.get(Uri.parse(categorized_url(
      category: category,
    )));
    if (r.statusCode == 200) {
      var jsonResponse = r.body;
      List<dynamic> news_items = jsonDecode(jsonResponse)['articles'];
      List<NewsModel> news = news_items
          .map(
            (e) => NewsModel.fromJSON(e),
          )
          .toList();

      log("used url ${news.map((e) => e.toJSON()).toList()}");
      return news;
    } else
      return [];
  }

  Future<void> searchNews(
    String keyword,
  ) async {
    http.Response r = await http.get(Uri.parse(search_url(keyword: keyword)));
    if (r.statusCode == 200) {
      var jsonResponse = r.body;
      var news_aricles = jsonDecode(jsonResponse)['articles'];
    }
  }
}
