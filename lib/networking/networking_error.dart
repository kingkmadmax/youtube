import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkError {
  static void handleError(DioException e, BuildContext context) {
    String message;
    if (e.type == DioExceptionType.connectionTimeout) {
      message = "Connection Timeout";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      message = "Receive Timeout";
    } else if (e.type == DioExceptionType.badResponse) {
      switch (e.response!.statusCode) {
        case 400:
          message = "Bad Request";
          break;
        case 401:
          message = "Unauthorized";
          break;
        case 403:
          message = "Forbidden";
          break;
        case 404:
          message = "Not Found";
          break;
        case 500:
          message = "Internal Server Error";
          break;
        case 502:
          message = "Bad Gateway";
          break;
        case 503:
          message = "Service Unavailable";
          break;
        default:
          message = "Something went wrong";
      }
    } else if (e.type == DioExceptionType.cancel) {
      message = "Request Cancelled";
    } else if (e.type == DioExceptionType.unknown) {
      message = "Unknown Error";
    } else if (e.type == DioExceptionType.badCertificate) {
      message = "Bad Certificate";
    } else if (e.type == DioExceptionType.connectionError) {
      message = "Connection Error";
    } else {
      message = "Something went wrong";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: e.response?.statusCode == 401 ? Colors.red : null,
      ),
    );
  }
}