import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User extends StatelessWidget {
  final name = "xxxxxxx";
  final phoneNumber = "xxxxxxxxxx";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            CircleAvatar(radius: 75, backgroundImage: null),
            Divider(color: Colors.white),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Divider(color: Colors.grey, height: 25, thickness: 2)
          ],
        ));
  }
}
