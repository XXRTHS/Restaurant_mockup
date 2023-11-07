import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'Get your dairy fresh bake',
                style: TextStyle(
                  color: AppColors.mainBlackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'signUp');
                    },
                    child: Ink(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.buttomBackground,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 7,
                                blurRadius: 12,
                                offset: Offset(0, 10))
                          ]),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'logIn');
                    },
                    child: Ink(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.iconColor2,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 7,
                                blurRadius: 12,
                                offset: Offset(0, 10))
                          ]),
                      child: Text(
                        'Log in',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'forgetPassword');
                  },
                  child: Ink(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      'Forget password?',
                      style:
                          TextStyle(color: Colors.grey, fontFamily: 'Nunito'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
