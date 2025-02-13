import 'package:dio/dio.dart';

class BaseAPI {
  final Dio _dio = Dio();

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response;
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
