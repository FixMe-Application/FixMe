import 'package:fix_me_app/authentication/login.dart';
import 'package:flutter/material.dart';

class GetStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          Column(
            
            children: <Widget>[
              new Container(
                color: Colors.blue[100].withOpacity(0.5),
                height: 350,
              ),
            ],
          ),
          Positioned(
            left: 135,
            top: 105,
            child: new Text(
              "FixMe",
              style: new TextStyle(
                color: Colors.blue,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
              top: 235,
              left: 95,
              child: new Container(
                width: 225.0,
                height: 225.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/image-front.png"))),
              )),
          Positioned(
            top: 600,
            left: 65,
            child: new RaisedButton(
              onPressed: ()=> {"Button pressed"},
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal:100, vertical: 10),
              child: new Text(
                
                "Let's Start",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 16.9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}
