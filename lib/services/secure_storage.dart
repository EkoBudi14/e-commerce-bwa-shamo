import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyToken = 'token';

  static Future setEmail(String email) async =>
      await _storage.write(key: _keyEmail, value: email);

  static Future<String> getEmail() async => await _storage.read(key: _keyEmail);

  static Future setPassword(String password) async =>
      await _storage.write(key: _keyPassword, value: password);

  static Future<String> getPassword() async =>
      await _storage.read(key: _keyPassword);

  static Future setToken(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String> getToken() async => await _storage.read(key: _keyToken);
}
