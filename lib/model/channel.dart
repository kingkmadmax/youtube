class Channel {
  final String id;
  final String title;
  final String description;
  final String profileImageUrl;
  final String subscriberCount;
  final String videoCount;
  final String bannerImageUrl;

  const Channel({
    required this.id,
    required this.title,
    required this.description,
    required this.profileImageUrl,
    required this.subscriberCount,
    required this.videoCount,
    required this.bannerImageUrl,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'] ?? '',
      title: json['snippet']?['title'] ?? 'Unknown',
      description: json['snippet']?['description'] ?? '',
      profileImageUrl: json['snippet']?['thumbnails']?['medium']?['url'] ?? '',
      subscriberCount: json['statistics']?['subscriberCount'] ?? '0',
      videoCount: json['statistics']?['videoCount'] ?? '0',
      bannerImageUrl:
          json['brandingSettings']?['image']?['bannerExternalUrl'] ?? '',
    );
  }
}

