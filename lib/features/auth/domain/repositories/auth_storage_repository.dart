abstract class AuthStorageRepository {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}
