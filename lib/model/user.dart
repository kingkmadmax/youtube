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