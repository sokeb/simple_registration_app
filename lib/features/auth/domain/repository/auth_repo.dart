import 'dart:convert';
import 'package:simple_registration_app/features/auth/domain/models/user_model.dart';
import 'package:simple_registration_app/features/auth/service/api_client.dart';

final class AuthRepo {
  AuthRepo({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<String?> registration({
    required UserModel user,
  }) async {
    try {
      final body = jsonEncode({
        'name': user.name,
        'email': user.email,
        'password': user.password,
      });

      final response = await _apiClient.requestRegistration(body: body);

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        return (data['message'] ?? 'An unknown error occurred') as String;
      }
    } catch (e) {
      return '$e';
    }
  }
}
