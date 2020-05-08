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
      home: MechanicRating(),
    );
  }
}

class MechanicRating extends StatefulWidget {
  @override
  _MechanicRatingState createState() => _MechanicRatingState();
}

class _MechanicRatingState extends State<MechanicRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rate your service with FixME",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 10, top: 60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Thank you for using FixME",
                style: TextStyle(fontSize: 25),
              ),
              Container(
                margin: EdgeInsets.all(20),
              ),
              RatingBar(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  labelText: 'FeedBack',
                  hintText: "Write your comment here",
                ),
                maxLines: 10,
              ),
              RaisedButton(
                child: Text("Submit"),
                onPressed: null)
            ],
          )),
    );
  }
}
