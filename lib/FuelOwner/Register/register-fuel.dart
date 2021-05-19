import 'package:fix_me_app/Driver/LocationSelection/LocationSelection.dart';
import 'package:fix_me_app/widgets/authentication/models/registerModel.dart';
import 'package:fix_me_app/widgets/authentication/models/user.dart';
import 'package:fix_me_app/widgets/authentication/services/apiService.dart';
import 'package:fix_me_app/widgets/authentication/services/authService.dart';
import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';

class RegisterFuel extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final userType;
  final password;

  RegisterFuel(
      this.firstName, this.lastName, this.email, this.password, this.userType);

  @override
  _RegisterFuelState createState() => _RegisterFuelState();
}

class _RegisterFuelState extends State<RegisterFuel> {
  final AuthService _auth = AuthService();
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
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 30,
                color: Colors.yellow[700]),
          ),
          centerTitle: true,
        ),
        body: Container(
            height: SizeConfig.screenHeight,
            color: Colors.grey[800],
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationSelection()));
                        }),
                    Text("Select your location in the map",
                        style: TextStyle(color: Colors.white))
                  ]),
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
                  padding: EdgeInsets.only(
                      left: SizeConfig.left / 3, right: SizeConfig.right / 3),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: SizeConfig.screenWidth / 20),
                  ),
                  color: Colors.lightBlue[900],
                  textColor: Colors.yellow[700],
                  onPressed: () async {
                    try {
                      User user = await _auth.registerWithEmailAndPassword(
                          widget.email, widget.password);
                      print(user.uid);

                      Post newPost = new Post(
                          uid: user.uid,
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          phoneNumber: pNumControler.text,
                          email: widget.email,
                          userType: widget.userType);
                      String p =
                          await createPost(regEndPoint, body: newPost.toMap());
                      print(p + " you are superb!");
                      Navigator.pop(context, null);
                    } catch (err) {
                      print('Caught error: $err');
                    }
                  }),
            ])))));
  }
}
