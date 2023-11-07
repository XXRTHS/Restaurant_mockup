import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';
import 'package:restaurant_web/screens/page/SplashScreen.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: ElevatedButton(
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: AppColors.textColor,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SplashScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.paraColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
