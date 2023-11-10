import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';
import 'package:badges/badges.dart' as badges;
import 'package:restaurant_web/model/product.dart';
import 'package:restaurant_web/widget/BottomCartSheet.dart';
import 'package:restaurant_web/widget/CategoriesWidget.dart';
import 'package:restaurant_web/widget/PopularWidget.dart';
import 'package:restaurant_web/widget/callApi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.paraColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: AppColors.textColor,
                      size: 30,
                    ),
                    Container(
                      //padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 2),
                          ]),
                      child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.red,
                        ),
                        badgeContent: Text(
                          '1',
                          style: TextStyle(
                              fontFamily: 'Nunito', color: Colors.white),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "BottomCartSheet");
                          },
                          child: Icon(
                            CupertinoIcons.cart,
                            size: 30,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      'What do you want to buy',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: AppColors.textColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.purplrColor3,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list_rounded)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: AppColors.purplrColor3,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    PopularItemWidget(),
                    CallApi(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
