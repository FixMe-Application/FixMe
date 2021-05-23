import 'package:fix_me_app/widgets/models/registerModel.dart';
import 'package:fix_me_app/widgets/models/user.dart';
import 'package:fix_me_app/widgets/authentication/services/apiService.dart';
import 'package:fix_me_app/widgets/authentication/services/authService.dart';
import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';

class RegisterDriver extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final password;
  final userType;

  RegisterDriver(
      this.firstName, this.lastName, this.email, this.password, this.userType);

  @override
  _RegisterDriverState createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
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
                controller: pNumControler,
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
                onPressed: () {},
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
                  labelText: 'Verification Code',
                  hintText: "XXXX",
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 10,
                    top: 50,
                    bottom: SizeConfig.blockSizeHorizontal * 10),
                child: Text(
                  "By creating an account you agree to our Terms of Service and Privacy Policy",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 25,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
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
                        String p = await createPost(regEndPoint,
                            body: newPost.toMap());
                        Navigator.pop(context, null);
                        print(p + "......heollooooooo.......");
                      } catch (e) {
                        print("Caught error $e");
                      }
                    }),
              )
            ])))));
  }
}
