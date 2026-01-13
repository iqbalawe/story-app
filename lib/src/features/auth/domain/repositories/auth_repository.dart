abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<String> register(String name, String email, String password);
  Future<bool> isLoggedIn();
  Future<void> logout();
}
