import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/model/newsModel.dart';
class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "entertainment-weekly",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "usa-today",
  ];
  static Future<NewsModel> fetchNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=e824cf703c8f4103b303db92c029d0ad"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];

    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];


    return NewsModel.fromAPItoApp(myArticle);
  }
}
