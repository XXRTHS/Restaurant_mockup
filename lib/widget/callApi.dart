import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_web/color/color.dart';
import 'package:restaurant_web/model/product.dart';

class CallApi extends StatefulWidget {
  const CallApi({Key? key}) : super(key: key);

  @override
  State<CallApi> createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {
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
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      color: Colors.black54),
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
                          child: Row(
                            children: [
                              Text(
                                _productItemList![i].name.toString(),
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                _productItemList![i].rating.toString(),
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
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
    return Scaffold(body: body);
  }
}
