import 'package:fix_me_app/sizeConfig.dart';
import 'package:fix_me_app/widgets/header.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            "Notifications",
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 15,
                color: Colors.yellow[700]),
          ),
        ));
  }
}
