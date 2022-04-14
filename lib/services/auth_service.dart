import 'dart:convert';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://10.0.2.2:8000/api';
  // String baseUrl = 'http://192.168.18.6:8000/api';

  // Future<String> _getTokenPreference() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString("token");
  // }
  // NOTE: REGISTER

  Future<UserModel> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Registrasi');
    }
  }

  // NOTE: LOGIN

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    // String token = await _getTokenPreference();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      // prefs.setString('token', token);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
