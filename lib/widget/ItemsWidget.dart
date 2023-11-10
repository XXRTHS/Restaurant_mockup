import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:restaurant_web/model/product.dart';
import 'package:restaurant_web/widget/callApi.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Nunito', color: Colors.black54),
              ),
            ],
          ),
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          shrinkWrap: true,
          children: [
            for (int i = 1; i <= 12; i++)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: AppColors.purplrColor3,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                      )
                    ]),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          "images/$i.jpg",
                          height: 110,
                          width: 110,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const CallApi(),

                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
