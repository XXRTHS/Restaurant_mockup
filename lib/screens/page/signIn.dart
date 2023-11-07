import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';
import 'package:restaurant_web/model/dialog.dart';
import 'package:restaurant_web/model/profile.dart';
import 'package:restaurant_web/screens/page/SplashScreen.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String Email ;
  late String Password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Profile profile = Profile(email: '', password: '');

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Icon(
                  Icons.login_rounded,
                  size: 100.0,
                  color: AppColors.iconColor2,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "HELLO AGAIN !",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: AppColors.mainBlackColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome back, you've been missed",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.grey,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 100.0,right: 100.0),
                  child: TextField(keyboardType: TextInputType.emailAddress,
                      onChanged:(value) => Email = value.trim() ,
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',border: OutlineInputBorder(borderSide: BorderSide(width: 50))
                      ),
                      onSubmitted: (String email){
                        profile.email = email;
                      }
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 100.0,right: 100.0),
                  child: TextField(onChanged:(value) => Password = value.trim() ,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',border: OutlineInputBorder(borderSide: BorderSide(width: 50),),
                    ),
                    obscureText: true,
                    onSubmitted: (String password){
                      profile.password = password;
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                print('Email = $Email,Password = $Password');
                if((Email?.isEmpty??true)||(Password?.isEmpty??true)){
                  normalDialog(context,'Please fill empty blank');
                }
                Navigator.pushReplacementNamed(context, 'homePage');
              },
              child: Ink(
                padding:
                EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.mainColor,
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
    );
  }
}
