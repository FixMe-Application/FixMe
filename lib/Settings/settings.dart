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
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Settings'),
          backgroundColor: Colors.blueAccent,
        ),
        body: new Container(
            child: new Column(children: <Widget>[
          User(),
          EditUser(),
          DeleteUser(),
          LogOut()
        ])));
  }
}
