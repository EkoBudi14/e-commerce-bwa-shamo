import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/services/auth_service.dart';
import 'package:shamo/services/secure_storage.dart';
import 'package:shamo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;
String finalPassword;
String finalToken;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

bool isAuth = false;
AuthService authService = AuthService();

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // getValidationData().whenComplete(() async {
    //   Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.pushNamed(
    //         context, finalEmail == null ? '/sign-in' : '/home'),
    //   );
    // });

    // _checkIfLoggedIn();
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    finalEmail = await SecureStorage.getEmail();
    finalPassword = await SecureStorage.getPassword();
    finalToken = await SecureStorage.getToken();

    Timer(
      Duration(seconds: 3),
      () async {
        if (finalToken != null) {
          await Provider.of<AuthProvider>(context, listen: false).login(
            email: finalEmail,
            password: finalPassword,
          );

          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushNamed(context, '/sign-in');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Union.png'),
            ),
          ),
        ),
      ),
    );
  }
}
