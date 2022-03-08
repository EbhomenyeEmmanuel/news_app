import 'dart:io';

import 'package:news_app/models/news.dart';
import 'package:news_app/models/news_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/stories.dart';

class NewsRepository {
  final url = "https://api.thenewsapi.com/v1/news";

  static const API_TOKEN = String.fromEnvironment("TOKEN");

  //Pass token
  Future<AllNewsData> getAllNewsByCategoryData(String category) async {
    final todayNews = await _getAllNewsByCategory(category);
    return AllNewsData(todayNews);
  }

  Future<NewsData> getTopStoriesData() async {
    print("Token is $API_TOKEN");
    final topStories = await _getTopStories();
    return NewsData(topStories);
  }

  Future<AllNewsData> searchAllNewsByCategoryData(String category, String searchKey) async {
    final todayNews = await _searchForAllNewsByCategory(category, searchKey);
    return AllNewsData(todayNews);
  }

  Future<List<News>> _getAllNewsByCategory(String category) async {
    try {
      final parsedUrl = Uri.parse(url + "/all?api_token=$API_TOKEN&language=en&categories=$category");
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      final rawJsonString = response.body;

      // Decode to json
      final Map<String, dynamic> jsonMap = jsonDecode(rawJsonString);

      // Go through each news and convert json to News object.
      if (jsonMap['data'] != null && statusCode == 200) {
        final allNewsStories = <News>[];
        jsonMap['data'].forEach((v) {
          allNewsStories.add(News.fromJson(v));
        });
        return allNewsStories;
      } else {
        return [];
      }
    } on SocketException catch (error) {
      print(error);
      return [];
    } on HttpException catch (error) {
      print(error);
      return [];
    } on FormatException catch (error) {
      print(error);
      return [];
    }
  }

  Future<List<News>> _searchForAllNewsByCategory(String category, String searchKey) async {
    try {
      final parsedUrl = Uri.parse(url + "/all?api_token=$API_TOKEN&language=en&categories=$category&search=$searchKey");
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      final rawJsonString = response.body;

      // Decode to json
      final Map<String, dynamic> jsonMap = jsonDecode(rawJsonString);

      // Go through each news and convert json to News object.
      if (jsonMap['data'] != null && statusCode == 200) {
        final allNewsStories = <News>[];
        jsonMap['data'].forEach((v) {
          allNewsStories.add(News.fromJson(v));
        });
        return allNewsStories;
      } else {
        return [];
      }
    } on SocketException catch (error) {
      print(error);
      return [];
    } on HttpException catch (error) {
      print(error);
      return [];
    } on FormatException catch (error) {
      print(error);
      return [];
    }
  }


  Future<List<Story>> _getTopStories() async {
    try {
      final parsedUrl = Uri.parse(url + "/top?api_token=$API_TOKEN&language=en");
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      final rawJsonString = response.body;

      // Decode to json
      final Map<String, dynamic> jsonMap = jsonDecode(rawJsonString);

      // Go through each news and convert json to News object.
      if (jsonMap['data'] != null && statusCode == 200) {
        final allNewsStories = <Story>[];
        jsonMap['data'].forEach((v) {
          allNewsStories.add(Story.fromJson(v));
        });
        return allNewsStories;
      } else {
        return [];
      }
    } on SocketException catch (error) {
      print(error);
      return [];
    } on HttpException catch (error) {
      print(error);
      return [];
    } on FormatException catch (error) {
      print(error);
      return [];
    }
  }

}
