import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User extends StatelessWidget {
  final name = "xxxxxxx";
  final phoneNumber = "xxxxxxxxxx";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: double.infinity,
        // margin: EdgeInsets.all(15),
        color: Colors.grey[800],
        child: Column(
          children: <Widget>[
            CircleAvatar(radius: 75, backgroundImage: null),
            Divider(color: Colors.grey[800]),
            Text(
              name,
              style: TextStyle(
                  fontSize: SizeConfig.screenHeight / 30,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            Text(
              phoneNumber,
              style: TextStyle(
                  fontSize: SizeConfig.screenHeight / 30,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Divider(color: Colors.grey, height: 25, thickness: 2)
          ],
        ));
  }
}
