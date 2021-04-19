import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      home: UserRating(),
    );
  }
}

class UserRating extends StatefulWidget {
  @override
  _UserRatingState createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          "Rate your service with FixME",
          style: TextStyle(
              fontSize: SizeConfig.screenWidth / 20, color: Colors.yellow[700]),
        ),
      ),
      body: Container(
          color: Colors.grey[700],
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
              ),
              Text(
                "Thank you for using FixME",
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 20, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.all(20),
              ),
              RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0)),
                  labelText: 'FeedBack',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Write your comment here",
                ),
                maxLines: 10,
              ),
              RaisedButton(
                  color: Colors.lightBlue[900],
                  padding: EdgeInsets.only(
                      left: SizeConfig.left / 5,
                      right: SizeConfig.right / 5,
                      top: SizeConfig.blockSizeHorizontal),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.yellow[700]),
                  ),
                  onPressed: () {})
            ],
          )),
    );
  }
}
