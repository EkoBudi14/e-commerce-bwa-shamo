import 'dart:convert';
import 'package:shamo/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Network{
  final String _url = 'http://192.168.18.6:8000/';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;
  UserModel user;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['access_token'];
  }

  authData(data, api) async {
    var fullUrl = _url + api;
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  getData(api) async {
    var fullUrl = _url + api;
    await _getToken();
    return await http.get(
        fullUrl,
        headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

}