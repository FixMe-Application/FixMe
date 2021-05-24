import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fix_me_app/CommonScreens/Menu%20pages/tasks.dart';
import 'package:fix_me_app/CommonScreens/Notifications/notifications.dart';
import 'package:fix_me_app/CommonScreens/Settings/settings.dart';
import 'package:fix_me_app/CommonScreens/about_us.dart';
import 'package:fix_me_app/CommonScreens/help.dart';
import 'package:fix_me_app/Driver/Payments/Payments-Settings.dart';
import 'package:fix_me_app/Widgets/Navigation/SideNav.dart';
import 'package:fix_me_app/widgets/authentication/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';

class MechanicHomePageFirst extends StatefulWidget {
  MechanicHomePageFirst({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MechanicHomePageFirstState createState() => _MechanicHomePageFirstState();
}

class _MechanicHomePageFirstState extends State<MechanicHomePageFirst> {
  final AuthService _auth = AuthService();
  FirebaseUser currentUser;

  void getUserData() async {
    currentUser = await _auth.getCurrentUser();

    DatabaseReference driverReference =
        FirebaseDatabase.instance.reference().child("drivers");

    DatabaseReference mechanicReference =
        FirebaseDatabase.instance.reference().child("mechanic");

    DatabaseReference requestReference = FirebaseDatabase.instance
        .reference()
        .child("drivers")
        .child(currentUser.uid);
  }

  // void deviceOnline() {
  //   Geofire.initialize("Available Mechanics");
  //   Geofire.setLocation(
  //       currentUser.uid, currentPosition.latitude, currentPosition.longitude);

  //   requestReference.onValue.listen((event) {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      extendBodyBehindAppBar: true,
      drawer: new Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white)),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.black87,
                  Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
                ],
              ),
            ),
            accountName: new Text('Raja'),
            accountEmail: new Text('testemail@test.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
            ),
          ),
          CustomListTile(
              Icons.calendar_today,
              'My Task',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TasksPage()))
                  }),
          CustomListTile(
              Icons.payment,
              'Payment',
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentSettings()))
                  }),
          CustomListTile(
              Icons.settings,
              'Settings',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()))
                  }),
          CustomListTile(
              Icons.info,
              'About Us',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutPage()))
                  }),
          CustomListTile(
              Icons.help,
              'Help',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Help()))
                  }),
          CustomListTile(
              Icons.input, 'Logout', () async => {await _auth.signOut()})
        ]),
      ),
    );
  }

  Widget appBarWidget() {
    return AppBar(
      backgroundColor: Colors.deepPurple[900],
      title: Text(
        "Accepted Requests",
        style: TextStyle(color: Colors.orange),
      ),
      elevation: 0.0,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.all(5),
          child: GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()))
                  },
              child: Icon(
                Icons.sms,
                size: 25,
              )),
        )
      ],
      iconTheme: IconThemeData(
        size: 30.0,
        color: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
      ),
    );
  }
}
