import 'package:flutter/material.dart';
import 'package:flutter_chat_app/custom_widgets/article_tile_widget.dart';
import 'package:flutter_chat_app/models/article_model.dart';
import 'package:flutter_chat_app/helper/news.dart';

class AgroNewsArticles extends StatefulWidget {
  const AgroNewsArticles({super.key});

  static String id = "AgroNewsArticles";

  @override
  State<AgroNewsArticles> createState() => _AgroNewsArticlesState();
}

class _AgroNewsArticlesState extends State<AgroNewsArticles> {

  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews(); // see method below
    
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "AgroNews Articles",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox( // here could be container (not size box) and  do padding - or wrap with padding
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column( 
                  children: [
                    // here add text widget about Ago news
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: ArticleTile(
                            imageUrl: articles[index].urlToImage ,
                            title: articles[index].title,
                            description: articles[index].description ,
                            url: articles[index].url,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

}

