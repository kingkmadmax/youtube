import 'package:youtube/model/user.dart';

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;
  final String categoryId;
  final String channelId;
  final String description;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
    required this.categoryId,
    required this.channelId,
    required this.description,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    final id =
        json['id'] is Map<String, dynamic> ? json['id']['videoId'] : json['id'];
    return Video(
      id: id ?? '',
      author: User.fromJson(json),
      title: json['snippet']?['title'] ?? 'No Title',
      thumbnailUrl: json['snippet']?['thumbnails']?['high']?['url'] ?? '',
      duration: json['contentDetails']?['duration'] ?? '0:00',
      timestamp: DateTime.parse(
          json['snippet']?['publishedAt'] ?? DateTime.now().toIso8601String()),
      viewCount: json['statistics']?['viewCount'] ?? '0',
      likes: json['statistics']?['likeCount'] ?? '0',
      dislikes: json['statistics']?['dislikeCount'] ?? '0',
      categoryId: json['snippet']?['categoryId'] ?? '',
      channelId: json['snippet']?['channelId'] ?? '',
      description: json['snippet']?['description'] ?? '',
    );
  }
}
