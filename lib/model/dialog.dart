import 'package:flutter/material.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Icon(Icons.warning_rounded,color: Colors.red,),
              title: Text(string,style: TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold),),
            ),
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
          ));
}
