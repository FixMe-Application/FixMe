import 'package:fix_me_app/Register/register.dart';
import 'package:fix_me_app/authentication/models/registerModel.dart';
import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';

class RegisterFuel extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final userType;

  RegisterFuel(this.firstName, this.lastName, this.email, this.userType);

  @override
  _RegisterFuelState createState() => _RegisterFuelState();
}

class _RegisterFuelState extends State<RegisterFuel> {
  static final regEndPoint =
      'https://us-central1-fixme-app.cloudfunctions.net/api/users';

  TextEditingController pNumControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            "Register",
            style: TextStyle(fontSize: 30, color: Colors.yellow[700]),
          ),
          centerTitle: true,
        ),
        body: Container(
            height: SizeConfig.screenHeight,
            color: Colors.grey[800],
            padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(children: <Widget>[
              Text(
                "Step 2/2",
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 15,
                    color: Colors.yellow[700]),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  labelText: 'Phone Number',
                  hintText: "0XXXXXXX",
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                  child: Text("Verify",
                      style: TextStyle(fontSize: SizeConfig.screenWidth / 20)),
                  color: Colors.lightBlue[900],
                  textColor: Colors.yellow[700],
                  onPressed: () {}),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey)),
                  labelText: 'Verification Code',
                  hintText: "XXXX",
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.yellow[700],
                        ),
                        tooltip: "Explorer",
                        iconSize: 60.0,
                        onPressed: () {}),
                    Text(
                      "Explorer",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        icon:
                            Icon(Icons.add_a_photo, color: Colors.yellow[700]),
                        tooltip: "Explorer",
                        iconSize: 60.0,
                        onPressed: () {}),
                    Text(
                      "Photos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add, color: Colors.yellow[700]),
                        tooltip: "Explorer",
                        color: Colors.white,
                        iconSize: 60.0,
                        onPressed: () {}),
                    Text(
                      "Photos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),

                  //  Icon(
                  //  Icons.add_a_photo,
                  //  color: Colors.blue,
                  //  size: 60.0,

                  //  ),
                  //   Icon(
                  //  Icons.add,
                  //  color: Colors.blue,
                  //  size: 60.0,
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 40, bottom: 20),
                child: Text(
                  "By creating an account you agree to our Terms of Service and Privacy Policy",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                  padding: const EdgeInsets.only(left: 120, right: 120),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 30),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () async {
                    try {
                      Post newPost = new Post(
                          uid: "9",
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          phoneNumber: pNumControler.text,
                          email: widget.email,
                          userType: widget.userType);
                      Post p =
                          await createPost(regEndPoint, body: newPost.toMap());
                      print(p.firstName + " you are superb!");
                    } catch (err) {
                      print('Caught error: $err');
                    }
                  }),
            ])))));
  }
}
