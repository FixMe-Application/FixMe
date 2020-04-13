import 'package:flutter/material.dart';

void main() => runApp(MyApp());

void verify(){

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: RegisterFuel(),
    );
  }
}

class RegisterFuel extends StatefulWidget {
   @override
  _RegisterFuelState createState() => _RegisterFuelState();
  

  
}
class _RegisterFuelState extends State<RegisterFuel> {
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
          
          
          padding: const EdgeInsets.only(left:20,top: 80,right:20),
          child:SingleChildScrollView(

            child: Form(       
               
            
            child: Column(
              
              
                children: <Widget>[
                  Text("Step 2/2", style: TextStyle(fontSize: 30,color: Colors.lightBlue),textAlign: TextAlign.center, ),
                  
                  
                  TextFormField(
                    
                    
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey,width: 1.0)),
                      
                        labelText: 'Phone Number', hintText: "0XXXXXXX"),
                        
                  ),
                   RaisedButton(
                    child: Text("Verify",style:TextStyle(fontSize: 20)),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: verify,
                    
                   ),