
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';


class ArticleViewDetails extends StatefulWidget {
  const ArticleViewDetails({super.key, this.articleUrl});

  final String? articleUrl ;

  @override
  State<ArticleViewDetails> createState() => _ArticleViewDetailsState();
}

class _ArticleViewDetailsState extends State<ArticleViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Article Details",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: WebViewPlus(
        initialUrl: widget.articleUrl,
      ),
    );
  }
}






