import 'package:flutter/material.dart';

void main() => runApp(MyApp());

void verify(){

}

 String dropdownValue = 'I have a garage';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: RegisterGarage(),
    );
  }
}

class RegisterGarage extends StatefulWidget {
   @override
  _RegisterGarageState createState() => _RegisterGarageState();
  

  
}
class _RegisterGarageState extends State<RegisterGarage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Register", style: TextStyle(fontSize: 30), ),
        centerTitle: true,
        ),
        body: 
        Container(
          color: Colors.white,
          
          
          padding: const EdgeInsets.only(left:20,top: 80,right:20),}}