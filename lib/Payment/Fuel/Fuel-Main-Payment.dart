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
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool fab = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Payment",
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        )),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Choose the fuel Type", style: TextStyle(fontSize: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.search,
                      ),
                      iconSize: 150.0,
                      onPressed: null),
                  IconButton(
                      padding: EdgeInsets.all(20),
                      icon: Icon(Icons.build),
                      iconSize: 150.0,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                color: Colors.blueAccent,
                                height: 280,
                                child: Column(children: <Widget>[
                                  Text(
                                    "Enter the Quantity",
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
                                          hintText: "0L"),
                                      style: TextStyle(fontSize: 30),
                                      scrollPadding: EdgeInsets.all(10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
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
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      onPressed: null)
                                ])));
                      }),
                     
                ],
              ),
               Text("Diesel                                Petrol",style: TextStyle(fontSize:25),),
               Text("Quantity:                                             2L",style: TextStyle(fontSize:25),),
              Text(
                "Full Payment :                   Rs.0000.00",
                style: TextStyle(fontSize: 25),
              ),
              RaisedButton(
                  child: Text(
                    "Paid",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: null)
            ],
          ),
        ));
  }
}
