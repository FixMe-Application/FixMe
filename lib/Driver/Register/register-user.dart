import 'package:fix_me_app/widgets/authentication/models/registerModel.dart';
import 'package:fix_me_app/widgets/authentication/models/user.dart';
import 'package:fix_me_app/widgets/authentication/services/apiService.dart';
import 'package:fix_me_app/widgets/authentication/services/authService.dart';
import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final password;
  final userType;

  RegisterUser(
      this.firstName, this.lastName, this.email, this.password, this.userType);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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
                fontSize: SizeConfig.screenWidth / 20,
                color: Colors.yellow[700]),
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
                    fontSize: SizeConfig.screenWidth / 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                controller: pNumControler,
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
                  child: Text("Verify", style: TextStyle(fontSize: 20)),
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
                margin: EdgeInsets.only(
                    left: 10,
                    top: 60,
                    bottom: SizeConfig.blockSizeHorizontal * 20),
                child: Text(
                  "By creating an account you agree to our Terms of Service and Privacy Policy",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
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
                        Post p = await createPost(regEndPoint,
                            body: newPost.toMap());
                        print(p.firstName + ".............");
                      } catch (e) {
                        print("Caught error $e");
                      }
                    }),
              )
            ])))));
  }
}
