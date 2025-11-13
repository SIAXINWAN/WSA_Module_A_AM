class NewsItem {
  final String id;
  final String title;
  final String summary;
  final String image;
  final String publishedAt;
  final List<String> content;

  NewsItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.image,
    required this.publishedAt,
    required this.content,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      summary: json['summary'] ?? '',
      image: json['image'] ?? '',
      publishedAt: json['published_at'] ?? '',
      content: (json['content'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
    );
  }
}
