import 'package:fix_me_app/Register/register.dart';
import 'package:fix_me_app/Authentication/models/registerModel.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final userType;

  RegisterUser(this.firstName, this.lastName, this.email, this.userType);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  static final regEndPoint =
      'https://us-central1-fixme-app.cloudfunctions.net/api/users';

  TextEditingController pNumControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Register",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(children: <Widget>[
              Text(
                "Step 2/2",
                style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                controller: pNumControler,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    labelText: 'Phone Number',
                    hintText: "0XXXXXXX"),
              ),
              RaisedButton(
                  child: Text("Verify", style: TextStyle(fontSize: 20)),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {}),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey)),
                  labelText: 'Verification Code',
                  hintText: "XXXX",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 60, bottom: 70),
                child: Text(
                  "By creating an account you agree to our Terms of Service and Privacy Policy",
                  style: TextStyle(fontSize: 20),
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
                          uid: "5",
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          phoneNumber: pNumControler.text,
                          email: widget.email,
                          userType: widget.userType);
                      Post p =
                          await createPost(regEndPoint, body: newPost.toMap());
                      print(p.firstName + " you are superb!");
                    } catch (e) {
                      print("Caught error $e");
                    }
                  }),
            ])))));
  }
}
