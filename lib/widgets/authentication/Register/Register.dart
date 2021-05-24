import 'package:fix_me_app/Driver/Register/Register-Driver.dart';
import 'package:fix_me_app/FuelOwner/Register/Register-Fuel.dart';
import 'package:fix_me_app/Mechanic/Register/Register-Garage.dart';
import 'package:fix_me_app/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String idScreen = "register";
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
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(
              children: <Widget>[
                Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Step 1/2",
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fNameController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.yellow, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff2a2e43),
                        width: 2.0,
                      ),
                    ),
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
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff2a2e43),
                          width: 2.0,
                        ),
                      ),
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
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff2a2e43),
                        width: 2.0,
                      ),
                    ),
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
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff2a2e43),
                        width: 2.0,
                      ),
                    ),
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
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff2a2e43),
                          width: 2.0,
                        ),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "XXXXXXX",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(1),
                ),
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15.0,
                      left: SizeConfig.left / 30,
                    ),
                    child: Text(
                      "User Type",
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ]),
                DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    elevation: 16,
                    dropdownColor: Color(0xff2a2e43),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 42,
                    style: TextStyle(
                      fontSize: 18.0,
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
                SizedBox(
                  height: 20.0,
                ),
                new Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff2a2e43),
                      padding: EdgeInsets.only(
                        left: SizeConfig.left / 3,
                        right: SizeConfig.right / 3,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      minimumSize: Size(100, 50),
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
                                builder: (context) => RegisterDriver(userFName,
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
