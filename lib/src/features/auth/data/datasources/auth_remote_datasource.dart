import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:story_app/src/core/network/dio_client.dart';
import 'package:story_app/src/core/utils/exception_handler.dart';
import 'package:story_app/src/features/auth/data/models/login_response_model.dart';
import 'package:story_app/src/features/auth/data/models/register_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<bool> login(String email, String password);
  Future<String> register(String name, String email, String password);
  Future<bool> hasToken();
  Future<void> logout();
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({required this.dioClient, required this.storage});

  final DioClient dioClient;
  final FlutterSecureStorage storage;

  @override
  Future<bool> login(String email, String password) async {
    try {
      final response = await dioClient.dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      final loginResponse = LoginResponseModel.fromJson(response.data);

      if (!loginResponse.error && loginResponse.loginResult != null) {
        final token = loginResponse.loginResult!.token;

        await storage.write(key: 'auth_token', value: token);

        return true;
      } else {
        throw Exception(loginResponse.message);
      }
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<String> register(String name, String email, String password) async {
    try {
      final response = await dioClient.dio.post(
        '/register',
        data: {'name': name, 'email': email, 'password': password},
      );

      final registerResponse = RegisterResponseModel.fromJson(response.data);

      if (!registerResponse.error) {
        return registerResponse.message;
      } else {
        throw Exception(registerResponse.message);
      }
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<bool> hasToken() async {
    final token = await storage.read(key: 'auth_token');
    return token != null;
  }

  @override
  Future<void> logout() async {
    await storage.delete(key: 'auth_token');
  }
}
