import 'package:fix_me_app/Menu%20pages/Settings/Edit_User_Widgets/password.dart';
import 'package:fix_me_app/Menu%20pages/Settings/Edit_User_Widgets/phoneNo.dart';
import 'package:fix_me_app/Menu%20pages/Settings/Edit_User_Widgets/profilePic.dart';
import 'package:fix_me_app/Menu%20pages/Settings/Edit_User_Widgets/userName.dart';
import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text('Edit my account',
              style: TextStyle(fontWeight: FontWeight.w500)),
          leading: Icon(
            Icons.edit,
            color: Colors.blue[500],
          ),
          onTap: () {
            var router = new MaterialPageRoute(builder: (BuildContext context) {
              return EditUserAccount();
            });

            Navigator.of(context).push(router);
          }),
    );
  }
}

class EditUserAccount extends StatefulWidget {
  @override
  _EditUserAccountState createState() => _EditUserAccountState();
}

class _EditUserAccountState extends State<EditUserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Edit Account'),
          backgroundColor: Colors.blueAccent,
        ),
        body: new Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            child: new Column(children: <Widget>[
              ProfilePic(),
              Divider(
                color: Colors.transparent,
              ),
              UserName(),
              PhoneNo(),
              Password(),
              Divider(color: Colors.transparent),
              Divider(color: Colors.transparent),
              Container(
                  width: 300,
                  height: 40,
                  child: RaisedButton(
                      child: new Text('Apply'),
                      hoverColor: Colors.blue,
                      color: Colors.blueAccent,
                      onPressed: () {}))
            ])));
  }
}
