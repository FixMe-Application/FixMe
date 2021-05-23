import 'package:fix_me_app/Driver/LocationSelection/LocationSelection.dart';
import 'package:fix_me_app/Widgets/Models/registerModel.dart';
import 'package:fix_me_app/Widgets/Models/User.dart';
import 'package:fix_me_app/Widgets/Authentication/Services/ApiService.dart';
import 'package:fix_me_app/Widgets/Authentication/Services/AuthService.dart';
import 'package:fix_me_app/Widgets/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String dropdownValue = 'I have a garage';

class RegisterGarage extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final userType;
  final password;

  RegisterGarage(
      this.firstName, this.lastName, this.email, this.password, this.userType);

  @override
  _RegisterGarageState createState() => _RegisterGarageState();
}

class _RegisterGarageState extends State<RegisterGarage> {
  final AuthService _auth = AuthService();
  static final regEndPoint =
      'https://us-central1-fixme-app.cloudfunctions.net/api/users';
  TextEditingController pNumControler = new TextEditingController();
  var result;
  var selectedLocationText = "Select your location in the map";
  LatLng selectedLocation;

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
              DropdownButton<String>(
                  dropdownColor: Colors.grey[800],
                  isExpanded: true,
                  value: dropdownValue,
                  iconSize: 29,
                  elevation: 2,
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      color: Colors.white),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['I have a garage', 'I haven\'t garage']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
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
                        onPressed: () async {
                          result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationSelection()));
                          setState(() {
                            selectedLocation = result[0];
                            selectedLocationText = result[1];
                          });
                        }),
                    Text(selectedLocationText,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                    padding: const EdgeInsets.only(left: 120, right: 120),
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
                        String p = await createPost(regEndPoint,
                            body: newPost.toMap());
                        print(p + " you are superb!");
                        Navigator.pop(context, null);
                      } catch (e) {
                        print('Caught error: $e');
                      }
                    }),
              )
            ])))));
  }
}
