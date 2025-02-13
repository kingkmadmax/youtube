class Comment {
  final String id;
  final String text;
  final String authorName;
  final String authorProfileImageUrl;
  final DateTime timestamp;
  final int likeCount;

  Comment({
    required this.id,
    required this.text,
    required this.authorName,
    required this.authorProfileImageUrl,
    required this.timestamp,
    required this.likeCount,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] ?? '',
      text: json['snippet']['topLevelComment']['snippet']['textDisplay'] ?? '',
      authorName: json['snippet']['topLevelComment']['snippet']
              ['authorDisplayName'] ??
          '',
      authorProfileImageUrl: json['snippet']['topLevelComment']['snippet']
              ['authorProfileImageUrl'] ??
          '',
      timestamp: DateTime.parse(json['snippet']['topLevelComment']['snippet']
              ['publishedAt'] ??
          DateTime.now().toIso8601String()),
      likeCount: json['snippet']['topLevelComment']['snippet']['likeCount'] ?? 0,
    );
  }
}
