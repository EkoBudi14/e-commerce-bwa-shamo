import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/checkout_page.dart';
import 'package:shamo/pages/checkout_success_page.dart';
import 'package:shamo/pages/detail_chat.dart';
import 'package:shamo/pages/edit_profile.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/carts_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/providers/whistlist_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          // '/detail-chat': (context) => DetailChat(),
          '/profile': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
