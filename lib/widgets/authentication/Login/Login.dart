import 'package:fix_me_app/Widgets/Authentication/Register/Register.dart';
import 'package:fix_me_app/widgets/authentication/services/authService.dart';
import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.screenWidth / 20,
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
        centerTitle: true,
      ),
      body: new Stack(children: <Widget>[
        new ListView(
          children: <Widget>[
            Padding(padding: new EdgeInsets.all(5.0)),
            SizedBox(
              height: 20.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: new Container(
                width: SizeConfig.screenWidth,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    children: <Widget>[
                      Padding(padding: new EdgeInsets.all(10.0)),
                      SizedBox(height: 15),
                      Container(
                        child: new RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          onPressed: () async {
                            bool result = await AuthService().loginWithGoogle();
                            if (!result) {
                              print("Error login with Google");
                            }
                            print("Login Successful with Google");
                          },
                          color: Colors.blue[50].withAlpha(220),
                          padding:
                              EdgeInsets.symmetric(horizontal: 94, vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image.asset(
                                "./assets/googlelogin.png",
                                height: SizeConfig.screenHeight / 20,
                                width: SizeConfig.screenWidth / 20,
                              ),
                              SizedBox(width: 10),
                              new Text(
                                "Login with Google",
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.screenWidth / 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: new RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          onPressed: () async {
                            bool result =
                                await AuthService().loginWithFacebook();
                            if (!result) {
                              print("Error login with Facebook");
                            }
                            print("Login Successful with facebook");
                          },
                          color: Colors.blue[50].withAlpha(220),
                          padding:
                              EdgeInsets.symmetric(horizontal: 86, vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image.asset(
                                "./assets/fblogin.png",
                                height: SizeConfig.screenHeight / 20,
                                width: SizeConfig.screenWidth / 20,
                              ),
                              SizedBox(width: 10),
                              new Text(
                                "Login with Facebook",
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.screenWidth / 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      new Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: Colors.lightBlue[900],
                          )),
                          SizedBox(width: 5),
                          new Text(
                            "OR",
                            style: new TextStyle(
                              fontSize: SizeConfig.screenWidth / 20,
                              color: Colors.lightBlue[900],
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                              child: Divider(
                            color: Colors.lightBlue[900],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      new TextFormField(
                          controller: emailController,
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          decoration: new InputDecoration(
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                fontSize: SizeConfig.screenWidth / 30,
                              ),
                              icon: new Icon(Icons.person))),
                      SizedBox(
                        height: 10.0,
                      ),
                      new TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Password should have more than 6 charactors'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        decoration: new InputDecoration(
                          hintText: 'Enter your Password',
                          hintStyle: TextStyle(
                            fontSize: SizeConfig.screenWidth / 30,
                          ),
                          icon: new Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(0, 0.25),
                            child: new Text(
                              "Have you fogotton your password? ",
                              style: new TextStyle(
                                color: Colors.lightBlue[900],
                                fontSize: SizeConfig.screenWidth / 25,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment(0, 0.25),
                              child: new InkWell(
                                child: new Text(
                                  "Click Here!",
                                  style: new TextStyle(
                                      color: Colors.lightBlue[900],
                                      decoration: TextDecoration.underline,
                                      fontSize: SizeConfig.screenWidth / 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                onTap: () => {
                                  print("Forgotten password screen!"),
                                  print(emailController.text),
                                  // ignore: sdk_version_ui_as_code
                                  if (emailController.text == '')
                                    {showAlertDialog(context)}
                                  else
                                    {
                                      showAlertDialogReset(context),
                                      _auth.sendPasswordResetEmail(
                                          emailController.text)
                                    }
                                },
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment(0, 0.25),
                  child: new Text(
                    "Don't have an account yet? ",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment(0, 0.25),
                    child: new InkWell(
                      child: new Text(
                        "Register Here!",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenWidth / 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () => {
                        print("Register page here"),
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Register()))
                      },
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: new RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);

                    if (result == null) {
                      setState(() =>
                          error = 'Unable to signin using this credentials');
                    }
                  }
                },
                color: Colors.lightBlue[900],
                child: new Text(
                  "LOGIN",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.screenWidth / 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Empty Email!"),
    content:
        Text("Please enter your email, when you need to reset your password."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogReset(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Reset Password!"),
    content: Text("Please find the password reset link in ********@********."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
