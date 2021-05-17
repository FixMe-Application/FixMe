import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Settings_Widgets/deleteUser.dart';
import 'Settings_Widgets/editUser.dart';
import 'Settings_Widgets/logOut.dart';
import 'Settings_Widgets/user.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Settings',
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 15,
                color: Colors.yellow[700]),
          ),
          backgroundColor: Colors.lightBlue[900],
        ),
        body: new Container(
            color: Colors.grey[800],
            height: SizeConfig.screenHeight,
            child: new Column(children: <Widget>[
              User(),
              EditUser(),
              DeleteUser(),
              LogOut()
            ])));
  }
}
