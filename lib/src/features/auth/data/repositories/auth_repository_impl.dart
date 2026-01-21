import 'package:story_app/src/features/auth/data/data.dart';
import 'package:story_app/src/features/auth/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.remoteDatasource});

  final AuthRemoteDatasource remoteDatasource;

  @override
  Future<void> login(String email, String password) async {
    await remoteDatasource.login(email, password);
  }

  @override
  Future<String> register(String name, String email, String password) async {
    return await remoteDatasource.register(name, email, password);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await remoteDatasource.hasToken();
  }

  @override
  Future<void> logout() async {
    await remoteDatasource.logout();
  }
}
