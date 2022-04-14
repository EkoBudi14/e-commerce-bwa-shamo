import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

String finalEmail;
bool isAuth = false;

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

    // Timer(
    //   Duration(seconds: 3),
    //   () => Navigator.pushNamed(
    //       context, isAuth == true ? '/home' : '/sign-in'),
    // );
    // _checkIfLoggedIn();
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-in');
  }
  // void _checkIfLoggedIn() async{
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   if(token != null){
  //     setState(() {
  //       isAuth = true;
  //     });
  //   }
  // }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString('email');

  //   setState(() {
  //     finalEmail = obtainedEmail;
  //   });

  //   print(finalEmail);
  // }

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
