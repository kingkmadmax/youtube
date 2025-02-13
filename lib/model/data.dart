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

class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['snippet']?['channelTitle'] ?? 'Unknown',
      profileImageUrl:
          '', // YouTube API does not provide profile image URL directly
      subscribers: '', // YouTube API does not provide subscriber count directly
    );
  }
}

const User currentUser = User(
  username: 'Marcus Ng',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Category {
  final String id;
  final String title;

  Category({required this.id, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      title: json['snippet']['title'] as String,
    );
  }
}

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

// final List<Video> videos = [
//   Video(
//     id: 'x606y4QWrxo',
//     author: currentUser,
//     title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
//     thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
//     duration: '8:20',
//     timestamp: DateTime(2021, 3, 20),
//     viewCount: '10K',
//     likes: '958',
//     dislikes: '4',
//     categoryId: '',
//   ),
//   Video(
//     author: currentUser,
//     id: 'vrPk6LB9bjo',
//     title:
//         'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
//     thumbnailUrl: 'https://i.ytimg.com/vi/vrPk6LB9bjo/0.jpg',
//     duration: '22:06',
//     timestamp: DateTime(2021, 2, 26),
//     viewCount: '8K',
//     likes: '485',
//     dislikes: '8',
//     categoryId: '',
//   ),
//   Video(
//     id: 'ilX5hnH8XoI',
//     author: currentUser,
//     title: 'Flutter Instagram Stories',
//     thumbnailUrl: 'https://i.ytimg.com/vi/ilX5hnH8XoI/0.jpg',
//     duration: '10:53',
//     timestamp: DateTime(2020, 7, 12),
//     viewCount: '18K',
//     likes: '1k',
//     dislikes: '4',
//     categoryId: '',
//   ),
// ];

// final List<Video> suggestedVideos = [
//   Video(
//     id: 'rJKN_880b-M',
//     author: currentUser,
//     title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
//     thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
//     duration: '1:13:15',
//     timestamp: DateTime(2020, 8, 22),
//     viewCount: '32K',
//     likes: '1.9k',
//     dislikes: '7',
//     categoryId: '',
//   ),
//   Video(
//     id: 'HvLb5gdUfDE',
//     author: currentUser,
//     title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
//     thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
//     duration: '1:52:12',
//     timestamp: DateTime(2020, 8, 7),
//     viewCount: '190K',
//     likes: '9.3K',
//     dislikes: '45',
//     categoryId: '',
//   ),
//   Video(
//     id: 'h-igXZCCrrc',
//     author: currentUser,
//     title: 'Flutter Chat UI Tutorial | Apps From Scratch',
//     thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
//     duration: '1:03:58',
//     timestamp: DateTime(2019, 10, 17),
//     viewCount: '358K',
//     likes: '20k',
//     dislikes: '85',
//     categoryId: '',
//   ),
// ];
