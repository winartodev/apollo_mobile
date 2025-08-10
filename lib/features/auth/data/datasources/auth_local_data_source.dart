import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAccessToken(String token);
  Future<void> cacheRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  static const _keyAccessToken = 'ACCESS_TOKEN';
  static const _keyRefreshToken = 'REFRESH_TOKEN';

  AuthLocalDataSourceImpl({required this.prefs});

  @override
  Future<void> cacheAccessToken(String token) async {
    await prefs.setString(_keyAccessToken, token);
  }

  @override
  Future<void> cacheRefreshToken(String token) async {
    await prefs.setString(_keyRefreshToken, token);
  }

  @override
  Future<String?> getAccessToken() async {
    return prefs.getString(_keyAccessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return prefs.getString(_keyRefreshToken);
  }
}
