import 'package:fix_me_app/Driver/LocationSelection/LocationSelection.dart';
import 'package:fix_me_app/widgets/Models/RegisterModel.dart';
import 'package:fix_me_app/widgets/Models/User.dart';
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
          backgroundColor: Color(0xff2a2e43),
          title: Text(
            "Register",
            style: TextStyle(
              fontSize: SizeConfig.screenWidth / 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
            height: SizeConfig.screenHeight,
            color: Colors.grey[700],
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(children: <Widget>[
              Text(
                "Step 2/2",
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff2a2e43),
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Phone Number',
                  hintText: "0XXXXXXX",
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xff2a2e43),
                    onSurface: Colors.grey,
                    minimumSize: Size(200.0, 50.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                    ),
                  ),
                  onPressed: () {}),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff2a2e43),
                      width: 2.0,
                    ),
                  ),
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
                          color: Color(0xff2a2e43),
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
                      fontSize: SizeConfig.screenWidth / 25,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xff2a2e43),
                    onSurface: Colors.grey,
                    minimumSize: Size(200.0, 50.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: SizeConfig.screenWidth / 20),
                  ),
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
