class News {
  final String uuid;
  final String title;
  final String description;
  final String keywords;
  final String snippets;
  final String url;
  final String imageUrl;
  final String language;
  final String publishedAt;
  final String source;
  final dynamic categories;
  final dynamic relevanceScore;

  News(
      {required this.uuid,
      required this.title,
      required this.description,
      required this.keywords,
      required this.snippets,
      required this.url,
      required this.imageUrl,
      required this.language,
      required this.publishedAt,
      required this.source,
      required this.categories,
      required this.relevanceScore});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        uuid: json['uuid'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        keywords: json['keywords'] as String,
        snippets: json['snippet'] as String,
        url: json['url'] as String,
        imageUrl: json['image_url'] as String,
        language: json['language'] as String,
        publishedAt: json['published_at'] as String,
        source: json['source'] as String,
        categories: json['categories'] ,
        relevanceScore: json['relevance_score']);}
}
