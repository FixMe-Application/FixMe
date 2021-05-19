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
      home: UserPaymentMechanic(),
    );
  }
}

class UserPaymentMechanic extends StatefulWidget {
  @override
  _UserPaymentMechanicState createState() => _UserPaymentMechanicState();
}

class _UserPaymentMechanicState extends State<UserPaymentMechanic> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            "Your Service Charge",
            style: TextStyle(
              fontSize: SizeConfig.screenWidth / 20,
              color: Colors.yellow[700],
            ),
            textAlign: TextAlign.center,
          )),
      body: Container(
        height: SizeConfig.screenHeight,
        color: Colors.grey[800],
        //  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
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
                  "Full Payment                  Rs.8050.00",
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
