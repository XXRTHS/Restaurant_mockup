import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/screens/page/Home_Page.dart';
import 'package:restaurant_web/screens/page/SplashScreen.dart';
import 'package:restaurant_web/screens/page/forgetPassword.dart';
import 'package:restaurant_web/screens/page/itemPage.dart';
import 'package:restaurant_web/screens/page/signIn.dart';
import 'package:restaurant_web/screens/page/signUp.dart';
import 'package:restaurant_web/widget/BottomCartSheet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Your Firebase project configuration goes here
    options: FirebaseOptions(
      apiKey: 'YOUR_API_KEY',
      authDomain: 'YOUR_AUTH_DOMAIN',
      projectId: 'YOUR_PROJECT_ID',
      storageBucket: 'YOUR_STORAGE_BUCKET',
      messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
      appId: 'YOUR_APP_ID',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (contex) => SplashScreen(),
      "signUp": (contex) => signUp(),
      "logIn": (contex) => logIn(),
      "forgetPassword": (contex) => forgetPassword(),
      "homePage": (contex) => MyHomePage(),
      "itemPage": (contex) => itemPage(),
      "BottomCartSheet": (contex) => BottomCartSheet(),

    });
  }
}
