import 'package:flutter/material.dart';
import 'news_api_service.dart';

class NewsProvider with ChangeNotifier {
  List<dynamic> _newsArticles = [];
  bool _isLoading = false;

  List<dynamic> get newsArticles => _newsArticles;
  bool get isLoading => _isLoading;

  Future<void> init() async {
    try {
      _newsArticles = await NewsApiService().fetchNews();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _newsArticles = await NewsApiService().fetchNews();
    } catch (e) {
      // Handle error
    }

    _isLoading = false;
    notifyListeners();
  }
}
