class HistoryItem {
  final int year;
  final String host;
  final String title;
  final String description;
  final bool isActive;

  HistoryItem({
    required this.year,
    required this.host,
    required this.title,
    required this.description,
    required this.isActive,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      year: json['year'] ?? 0,
      host: json['host'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'host': host,
      'title': title,
      'description': description,
      'is_active': isActive,
    };
  }
}
