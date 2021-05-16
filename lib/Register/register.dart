import 'dart:convert';
import 'package:fix_me_app/Menu%20pages/Settings/Edit_User_Widgets/password.dart';
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
  TextEditingController passwordController = new TextEditingController();

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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Step 1/2",
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.yellow, width: 1.0)),
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Zeena",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
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
                      labelStyle: TextStyle(color: Colors.white),
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
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "zeena2gmail.com",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "XXXXXXX",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey)),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "XXXXXXX",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(1),
                ),
                Row(children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.white,
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
                    dropdownColor: Colors.grey[800],
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
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
                new Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 30, color: Colors.yellow[700]),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue[900],
                      padding: EdgeInsets.only(
                          left: SizeConfig.left / 3,
                          right: SizeConfig.right / 3),
                    ),
                    onPressed: () async {
                      final userFName = fNameController.text;
                      final userLName = lNameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;

                      if (dropdownValue == "As a Mechanic") {
                        final userType = dropdownValue;

                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterGarage(userFName,
                                    userLName, email, password, userType)));
                        if (result == null) {
                          return Navigator.pop(context);
                        }
                      } else if (dropdownValue == "As a Driver") {
                        final userType = dropdownValue;

                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterUser(userFName,
                                    userLName, email, password, userType)));
                        if (result == null) {
                          return Navigator.pop(context);
                        }
                      } else if (dropdownValue == "As a Fuel Supplier") {
                        final userType = dropdownValue;

                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterFuel(userFName,
                                    userLName, email, password, userType)));
                        if (result == null) {
                          return Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
              ],
            )))));
  }
}
