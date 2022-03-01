import 'news.dart';
import 'stories.dart';

class NewsData {
  final List<Story> todayStories;

  NewsData(
    this.todayStories,
  );
}

class AllNewsData {
  final List<News> allNews;

  AllNewsData(
    this.allNews,
  );
}
