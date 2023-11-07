import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 1; i <= 12; i++)
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.purplrColor3,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image.asset(
                            'images/$i.jpg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ))
            ],
          ),
        ),
      ],
    );
  }
}
