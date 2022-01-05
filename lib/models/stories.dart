class Story {
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
  final List<String> categories;
  final String relevanceScore;
  final String locale;

  Story(
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
      required this.relevanceScore,
      required this.locale});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
        uuid: json['uuid'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        keywords: json['keywords'] as String,
        snippets: json['snippets'] as String,
        url: json['url'] as String,
        imageUrl: json['imageUrl'] as String,
        language: json['language'] as String,
        publishedAt: json['publishedAt'] as String,
        source: json['source'] as String,
        categories: json['categories'] as List<String>,
        relevanceScore: json['relevanceScore'] as String,
        locale: json['locale'] as String);
  }
}
