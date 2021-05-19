import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

void confirmd() {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Confirm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConfirmUser(),
    );
  }
}

class ConfirmUser extends StatefulWidget {
  @override
  _ConfirmUserState createState() => _ConfirmUserState();
}

class _ConfirmUserState extends State<ConfirmUser> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            "Order Confirm",
            style: TextStyle(
              fontSize: SizeConfig.screenWidth / 20,
              color: Colors.yellow[700],
            ),
            textAlign: TextAlign.center,
          )),
      body: Container(
        height: SizeConfig.screenHeight,
        color: Colors.grey[800],
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight / 3),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueAccent,
                      style: BorderStyle.solid,
                      width: 2.0)),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Basic Charge                   Rs.850.00",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 17,
                      shadows: [],
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
            ),
            Text(
              "Full Service Charge will depend on the service gain by the mechanic you selected",
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 30,
                  shadows: [],
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
                child: Text("Confirm",
                    style:
                        TextStyle(color: Colors.yellow[700], fontSize: 20.0)),
                color: Colors.lightBlue[900],
                onPressed: confirmd)
          ],
        ),
      ),
    );
  }
}
