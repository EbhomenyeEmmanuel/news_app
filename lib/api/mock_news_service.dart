import 'package:news_app/models/stories.dart';
import 'package:news_app/models/news_data.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MockBreakingNewsService {
  Future<NewsData> getNewsData() async {
    final todayNews = await _getNews();
    return NewsData(todayNews);
  }

  // Get sample explore recipes json to display in ui
  Future<List<Story>> _getNews() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 300));
    // Load json from file system
    final dataString = await _loadAsset(
      'assets/sample_data/sample_data_top_stories.json',
    );
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each news and convert json to News object.
    if (json['data'] != null) {
      final stories = <Story>[];
      json['data'].forEach((v) {
        stories.add(Story.fromJson(v));
      });
      return stories;
    } else {
      return [];
    }
  }

// Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
