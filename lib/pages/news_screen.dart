import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/news_provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, __) {
        // newsProvider.fetchNews();
        return Scaffold(
          appBar: AppBar(
            title: Text('Latest News'),
          ),
          body: newsProvider.newsArticles.isEmpty
              ? const Center(
                  child: Text("Loading...Please refresh"),
                )
              : newsProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: newsProvider.newsArticles.length,
                      itemBuilder: (context, index) {
                        final article = newsProvider.newsArticles[index];
                        return ListTile(
                          title: Text(article['title']),
                          subtitle:
                              Text(article['description'] ?? 'No description'),
                        );
                      },
                    ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              newsProvider.fetchNews();
            },
            child: Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}
