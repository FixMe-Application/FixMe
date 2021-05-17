import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';

class GetStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: new Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                color: Colors.deepPurple[900],
                height: SizeConfig.blockSizeVertical * 50,
              ),
            ],
          ),
          Positioned(
            left: SizeConfig.left / 3,
            right: SizeConfig.right / 3,
            top: SizeConfig.blockSizeVertical * 20,
            child: new Text(
              " FixMe",
              style: new TextStyle(
                color: Colors.yellow[800],
                fontSize: SizeConfig.screenWidth / 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
              top: SizeConfig.blockSizeVertical * 35,
              left: SizeConfig.left / 4,
              child: new Container(
                width: SizeConfig.screenWidth / 2,
                height: SizeConfig.screenHeight / 2,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(
                        "./assets/car.png",
                      ),
                    )),
              )),
          Positioned(
              top: SizeConfig.blockSizeVertical * 80,
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal / 1,
                    vertical: SizeConfig.blockSizeVertical * 10),
                child: ElevatedButton(
                  onPressed: () => {"Button pressed"},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  child: new Text(
                    "Let's Start",
                    style: new TextStyle(
                      color: Colors.yellow[800],
                      fontSize: SizeConfig.screenWidth / 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )),
        ],
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
