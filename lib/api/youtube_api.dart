import 'package:youtube/api/base_apis.dart';
import 'package:youtube/utils/constants.dart';
import 'package:youtube/model/data.dart';

class YouTubeAPI {
  final BaseAPI _baseAPI = BaseAPI();

  Future<List<Video>> fetchVideos() async {
    final response = await _baseAPI.get('$baseUrl/videos', params: {
      'part': 'snippet,contentDetails,statistics',
      'chart': 'mostPopular',
      'regionCode': 'US',
      'maxResults': 2,
      'key': apiKey,
    });

    final List<dynamic> items = response.data['items'];
    return items.map((item) => Video.fromJson(item)).toList();
  }

  Future<List<Video>> fetchSuggestedVideos(String videoTitle) async {
    final searchTerms = videoTitle.split(' ').take(3).join(' ');
    final response = await _baseAPI.get('$baseUrl/search', params: {
      'part': 'snippet',
      'q': searchTerms,
      'type': 'video',
      'maxResults': 2,
      'key': apiKey,
    });

    final List<dynamic> items = response.data['items'];
    return items.map((item) => Video.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await _baseAPI.get('$baseUrl/videoCategories', params: {
      'part': 'snippet',
      'regionCode': 'US',
      'maxResults': 2,
      'key': apiKey,
    });

    final List<dynamic> items = response.data['items'];
    return items.map((item) => Category.fromJson(item)).toList();
  }

  Future<List<Video>> fetchVideosByCategory(String categoryId) async {
    final response = await _baseAPI.get('$baseUrl/search', params: {
      'part': 'snippet',
      'type': 'video',
       'regionCode': 'US',
      'videoCategoryId': categoryId,
      'maxResults': 2,
      'key': apiKey,
    });

    final List<dynamic> items = response.data['items'];
    return items.map((item) => Video.fromJson(item)).toList(); // Pass the entire item
  }

  Future<Channel> fetchChannelInfo(String channelId) async {
    final response = await _baseAPI.get('$baseUrl/channels', params: {
      'part': 'snippet,statistics',
      'id': channelId,
      'maxResults': 2,
      'key': apiKey,
    });

    final item = response.data['items'][0];
    return Channel.fromJson(item);
  }

  Future<List<Video>> fetchVideosByChannel(String channelId) async {
    final response = await _baseAPI.get('$baseUrl/search', params: {
      'part': 'snippet',
      'channelId': channelId,
      'maxResults': 2,
      'key': apiKey,
    });

    final List<dynamic> items = response.data['items'];
    return items.map((item) => Video.fromJson(item)).toList();
  }
}


