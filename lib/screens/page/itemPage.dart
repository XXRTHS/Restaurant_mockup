import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';
import 'package:restaurant_web/model/product.dart';

class itemPage extends StatefulWidget {
  const itemPage({super.key});

  @override
  State<itemPage> createState() => _itemPageState();
}

class _itemPageState extends State<itemPage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<ProductItem>? _productItemList;
  String? _error;

  Future<void> getProductItem() async {
    try {
      setState(() {
        _error = null;
      });

      final response = await _dio.get('http://localhost:3000/product');
      debugPrint(response.data.toString());

      List list = jsonDecode(response.data.toString());
      setState(() {
        _productItemList =
            list.map((item) => ProductItem.fromJson(item)).toList();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getProductItem();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_error != null) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_error!),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              getProductItem();
            },
            child: const Text('RETRY'),
          )
        ],
      );
    } else if (_productItemList == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = Column(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 260,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/1.jpg"),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'homePage');
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: AppColors.paraColor,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _productItemList![1].name.toString(),
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: AppColors.textColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Icon(CupertinoIcons.minus),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "01",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: AppColors.textColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Icon(CupertinoIcons.plus),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 25,
                          ),
                          Text(
                            _productItemList![1].rating.toString(),
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _productItemList![1].description.toString(),
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Text(
                              "Preorder Time",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.clock,
                              color: AppColors.textColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '1-3 days',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        _productItemList![1].price.toString() + " -.THB",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Nunito',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Ink(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            color: AppColors.paraColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: AppColors.textColor,
                              size: 24,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Nunito',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
    return Scaffold(body: body);
  }
}
