import 'package:flutter/material.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String buttonOneText;
  final String buttonTwoText;
  final VoidCallback buttonOneOnPressed;

  ConfirmationBottomSheet(
      {this.title,
      this.description,
      this.buttonOneText,
      this.buttonTwoText,
      this.buttonOneOnPressed});

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                description,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              // ignore: deprecated_member_use
              child: TextButton(
                child: Text(
                  buttonOneText,
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  onSurface: Colors.grey,
                ),
                onPressed: buttonOneOnPressed,
              ),
            ),
            // ignore: deprecated_member_use
            TextButton(
              child: Text(
                buttonTwoText,
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey,
              ),
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
