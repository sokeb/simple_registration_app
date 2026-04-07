import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:simple_registration_app/features/auth/service/app_urls.dart';

class ApiClient {
  final AppUrls _appUrls = AppUrls();

  Future<http.Response> requestRegistration({required String body}) async {
    return _post(_appUrls.register, body);
  }

  Future<http.Response> _post(String url, String body) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: body,
          )
          .timeout(const Duration(seconds: 10)); // Timeout after 10s

      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Server took too long to respond');
    }
  }

  /// Validates the HTTP status code
  http.Response _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw Exception('Bad Request: ${_extractErrorMessage(response)}');
      case 401:
        throw Exception('Unauthorized: Please login again');
      case 409:
        throw Exception(_extractErrorMessage(response));
      case 403:
        throw Exception('Forbidden: You do not have permission');
      case 422:
        throw Exception('Validation Error: ${_extractErrorMessage(response)}');
      case 500:
        throw Exception('Server Error: Please try again later');
      default:
        throw Exception('Error occurred with code: ${response.statusCode}');
    }
  }

  /// Helper to extract error message from API JSON body if available
  String _extractErrorMessage(http.Response response) {
    try {
      final body = jsonDecode(response.body);
      return (body['message'] ?? 'Unknown error') as String;
    } catch (_) {
      return 'Response body was empty or invalid';
    }
  }
}
