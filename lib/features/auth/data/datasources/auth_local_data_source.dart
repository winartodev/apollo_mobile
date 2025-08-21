import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> cacheAccessToken(String token);
  Future<bool> cacheRefreshToken(String token);
  Future<bool> clearTokens();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  static const _keyAccessToken = 'ACCESS_TOKEN';
  static const _keyRefreshToken = 'REFRESH_TOKEN';

  AuthLocalDataSourceImpl({required this.prefs});

  @override
  Future<bool> cacheAccessToken(String token) async {
    try {
      final success = await prefs.setString(_keyAccessToken, token);

      // Verify the token was actually saved
      if (success) {
        final savedToken = prefs.getString(_keyAccessToken);
        return savedToken == token;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> cacheRefreshToken(String token) async {
    try {
      final success = await prefs.setString(_keyRefreshToken, token);

      // Verify the token was actually saved
      if (success) {
        final savedToken = prefs.getString(_keyRefreshToken);
        return savedToken == token;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearTokens() async {
    try {
      // Remove tokens
      final accessRemoved = await prefs.remove(_keyAccessToken);
      final refreshRemoved = await prefs.remove(_keyRefreshToken);

      // Verify they were actually removed
      if (accessRemoved && refreshRemoved) {
        final accessExists = prefs.containsKey(_keyAccessToken);
        final refreshExists = prefs.containsKey(_keyRefreshToken);

        return !accessExists && !refreshExists;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return prefs.getString(_keyAccessToken);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return prefs.getString(_keyRefreshToken);
    } catch (e) {
      return null;
    }
  }
}
