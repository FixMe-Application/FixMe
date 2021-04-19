import 'package:fix_me_app/sizeConfig.dart';
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
      home: MechanicMain(),
    );
  }
}

class MechanicMain extends StatefulWidget {
  @override
  _MechanicMainState createState() => _MechanicMainState();
}

class _MechanicMainState extends State<MechanicMain> {
  bool fab = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue[900],
            title: Text(
              "Payment",
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 15,
                  color: Colors.yellow[700]),
              textAlign: TextAlign.center,
            )),
        body: Container(
          color: Colors.grey[700],
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Choose the payment method",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 15,
                      color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.search,
                      ),
                      iconSize: SizeConfig.screenWidth / 4,
                      onPressed: null),
                  IconButton(
                      padding: EdgeInsets.all(20),
                      icon: Icon(Icons.build),
                      iconSize: SizeConfig.screenWidth / 4,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                color: Colors.blueAccent,
                                height: 200,
                                child: Column(children: <Widget>[
                                  Text(
                                    "Enter the Amount",
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    height: 70,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Rs. 00000.00"),
                                      style: TextStyle(fontSize: 30),
                                      scrollPadding: EdgeInsets.all(10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  RaisedButton(
                                      child: Text(
                                        "Confirm",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.screenWidth / 15),
                                      ),
                                      onPressed: null)
                                ])));
                      }),
                ],
              ),
              Text(
                "Full Payment :                   Rs.0000.00",
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 20, color: Colors.white),
              ),
              RaisedButton(
                  child: Text(
                    "Paid",
                    style: TextStyle(fontSize: SizeConfig.screenWidth / 20),
                  ),
                  onPressed: null)
            ],
          ),
        ));
  }
}
