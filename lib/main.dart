import 'package:flutter/material.dart';
import './Register-Fuel.dart';
import './Register-Garage.dart';
import './Register-User.dart';

void main() => runApp(MyApp());

void verify(){
  


}


 String dropdownValue = 'One';

class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Register(),
    );
  }
}
class Register extends StatefulWidget {


   @override
  _RegisterState createState() => _RegisterState();
  

  
}
class _RegisterState extends State<Register> { 
 


  @override
  Widget build(BuildContext context) {
    
  }}