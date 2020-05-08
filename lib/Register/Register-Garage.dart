import 'package:fix_me_app/Register/register.dart';
import 'package:fix_me_app/Authentication/models/registerModel.dart';
import 'package:flutter/material.dart';

String dropdownValue = 'I have a garage';

class RegisterGarage extends StatefulWidget {
  final firstName;
  final lastName;
  final email;
  final userType;

  RegisterGarage(this.firstName, this.lastName, this.email, this.userType);

  @override
  _RegisterGarageState createState() => _RegisterGarageState();
}

class _RegisterGarageState extends State<RegisterGarage> {
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
                margin: EdgeInsets.all(10),
              ),
              DropdownButton<String>(
                  value: dropdownValue,
                  iconSize: 29,
                  elevation: 2,
                  style: TextStyle(fontSize: 25, color: Colors.black),
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
                          color: Colors.blue,
                        ),
                        tooltip: "Explorer",
                        iconSize: 60.0,
                        onPressed: () {}),
                    Text("Explorer")
                  ]),
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add_a_photo, color: Colors.blue),
                        tooltip: "Explorer",
                        iconSize: 60.0,
                        onPressed: () {}),
                    Text("Photos"),
                  ]),
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add, color: Colors.blue),
                        tooltip: "Explorer",
                        iconSize: 60.0,
                        onPressed: () {}),
                    Text("Photos"),
                  ]),

                  //  Icon(
                  //  Icons.add_a_photo,
                  //  color: Colors.blue,
                  //  size: 60.0,

                  //  ),
                  //   Icon(
                  //  Icons.add,
                  //  color: Colors.blue,
                  //  size: 60.0,
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 40, bottom: 20),
                child: Text(
                  "By creating an account you agree to our Terms of Service and Privacy Policy",
                  style: TextStyle(fontSize: 15),
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
                  onPressed: () async {try {
                     Post newPost = new Post(
                        uid: "5",
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        phoneNumber: pNumControler.text,
                        email: widget.email,
                        userType: widget.userType);
                    Post p = await createPost(regEndPoint,
                        body: newPost.toMap());
                    print(p.firstName + " you are superb!");
                    
                  } catch (e) {
                    print('Caught error: $e');
                  }
                   
                  }),
            ])))));
  }
}
