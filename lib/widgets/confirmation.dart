import 'package:flutter/material.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String buttonOneText;
  final String buttonTwoText;

  ConfirmationBottomSheet(
      {this.title, this.description, this.buttonOneText, this.buttonTwoText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                buttonOneText,
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                //Add necessary function
              },
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                buttonTwoText,
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
