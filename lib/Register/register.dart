import 'dart:convert';
import 'package:fix_me_app/authentication/models/registerModel.dart';
import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'register-fuel.dart';
import 'register-garage.dart';
import 'register-user.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

String dropdownValue = 'As a Driver';

class _RegisterState extends State<Register> {
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: Text(
            "Register",
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 20,
                color: Colors.yellow[700]),
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.grey[800],
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(
              children: <Widget>[
                Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Step 1/2",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: fNameController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.0)),
                      labelText: 'First Name',
                      hintText: "Zeena"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                TextFormField(
                    controller: lNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.0)),
                      labelText: 'Last Name',
                      hintText: "Youhan",
                      hintStyle: TextStyle(color: Colors.white),
                    )),
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey)),
                    labelText: 'Email',
                    hintText: "zeena2gmail.com",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey)),
                    labelText: 'Password',
                    hintText: "XXXXXXX",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey)),
                      labelText: 'Confirm Password',
                      hintText: "XXXXXXX",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                Container(
                  margin: const EdgeInsets.all(1),
                ),
                Row(children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: SizeConfig.right / 4,
                        top: 10,
                        left: SizeConfig.left / 4),
                    child: Text(
                      "User type",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth / 20,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ]),
                DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'As a Driver',
                      'As a Fuel Supplier',
                      'As a Mechanic'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight / 8,
                      bottom: SizeConfig.blockSizeVertical / 50),
                ),
                ElevatedButton(
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 30, color: Colors.yellow[700]),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[900],
                    padding: EdgeInsets.only(
                        left: SizeConfig.left / 3, right: SizeConfig.right / 3),
                  ),
                  onPressed: () async {
                    final userFName = fNameController.text;
                    final userLName = lNameController.text;
                    final email = emailController.text;

                    if (dropdownValue == "As a Mechanic") {
                      final userType = dropdownValue;

                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterGarage(
                                  userFName, userLName, email, userType)));
                    } else if (dropdownValue == "As a Driver") {
                      final userType = dropdownValue;

                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUser(
                                  userFName, userLName, email, userType)));
                    } else if (dropdownValue == "As a Fuel Supplier") {
                      final userType = dropdownValue;
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterFuel(
                                  userFName, userLName, email, userType)));
                    }
                  },
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical / 2),
                ),
              ],
            )))));
  }
}

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}
