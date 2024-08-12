import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/screens/article_details_screen.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile(
      {super.key, this.imageUrl, this.title, this.description, this.url});
  final String? imageUrl, title, description, url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ArticleViewDetails(articleUrl: url,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imageUrl!,
                      errorBuilder: (context, error, stackTrace) {
                        // Handle image loading error
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: Image.asset(
                                imageAgroNewsPlaceholder), //Icon(Icons.error)
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const CircularProgressIndicator();
                        } else {
                          return child;
                        }
                      },
                    ),
                  )
                : const SizedBox(height: 100), // Placeholder for missing image
            const SizedBox(height: 5),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            Text(
              description ?? '',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



