import 'package:fix_me_app/CommonScreens/Settings/Edit_User_Widgets/password.dart';
import 'package:fix_me_app/CommonScreens/Settings/Edit_User_Widgets/phoneNo.dart';
import 'package:fix_me_app/CommonScreens/Settings/Edit_User_Widgets/profilePic.dart';
import 'package:fix_me_app/CommonScreens/Settings/Edit_User_Widgets/userName.dart';
import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: ListTile(
          title: Text('Edit my account',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenHeight / 30)),
          leading: Icon(
            Icons.edit,
            color: Colors.lightBlue[900],
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
          title: new Text(
            'Edit Account',
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 15,
                color: Colors.yellow[700]),
          ),
          backgroundColor: Colors.lightBlue[900],
        ),
        body: new Container(
            color: Colors.grey[700],
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
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight / 10,
                  child: RaisedButton(
                      child: new Text(
                        'Apply',
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight / 30,
                            color: Colors.yellow[700]),
                      ),
                      hoverColor: Colors.lightBlue[900],
                      color: Colors.lightBlue[900],
                      onPressed: () {}))
            ])));
  }
}
