import 'package:flutter_chat_app/models/article_model.dart';
import 'package:flutter_chat_app/util/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {

  List<ArticleModel> news = [];
  
  Future<void> getNews() async {

    String url = urlAgroNews;
    
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      return jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }


}
