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
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Register", style: TextStyle(fontSize: 30), ),
        centerTitle: true,
        ),
        body: 
        Container(
          color: Colors.white,
          
          
          padding: const EdgeInsets.only(left:20,top: 40,right:20),
          child:SingleChildScrollView(

            child: Form(       
               
            
            child: Column(
              
              
                children: <Widget>[
                  Text("CREATE ACCOUNT", style: TextStyle(fontSize: 30,color: Colors.lightBlue),textAlign: TextAlign.center, ),
                  Text("Step 1/2", style: TextStyle(fontSize: 30,color: Colors.lightBlue),textAlign: TextAlign.center, ),
                  
                  
                  TextFormField(
                    
                    
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey,width: 1.0)),
                      
                        labelText: 'Full Name', hintText: "Zeena Youhan"),
                        
                        
                  ),
                   Container(
                     margin: const EdgeInsets.all(10),
                   ),
                    TextFormField(
                    decoration: InputDecoration(
                     
                      border: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                        labelText: 'Email', hintText: "zeena2gmail.com", ),
                       
                        
                  ),
                  Container(
                     margin: const EdgeInsets.all(10),
                   ),
                  TextFormField
                  (
                    decoration: 
                    InputDecoration(
                     
                      border: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                      labelText: 'Password', hintText: "XXXXXXX", ),
                       
                        
                  ),
                  Container(
                     margin: const EdgeInsets.all(10),
                   ),
                  TextFormField(
                    
                    decoration: InputDecoration(
                      
                     
                      border: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                        labelText: 'Confirm Password', hintText: "XXXXXXX", ),
                       
                        
                  ),
                  Container(
                     margin: const EdgeInsets.all(1),
                    
                   ),
                   Row(
                      
                      children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                  Container(
                    margin: const EdgeInsets.only(right: 220,top: 10,left: 10),
                    
                    
                    child: Text("User Type:", style: TextStyle(fontSize:25, color: Colors.blue), textAlign: TextAlign.left, ),
                     
                   ),]),
                   
                   DropdownButton<String>(
                     
                     value: "As a Driver",
                     iconSize: 24,
                     elevation: 16,
                     style: TextStyle(fontSize:25,color: Colors.black), 
                     onChanged: (String newValue) {
                       setState(() {
                         dropdownValue = newValue;
                         });
                         },
                         items: <String>['As a Driver', 'As a Fuel Supplier', 'As a Machanic']
                         .map<DropdownMenuItem<String>>((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value),
                             );
                             }).toList()
                             ),
RaisedButton(
                     padding: const EdgeInsets.only(left:140,right: 140),
                   
                    child: Text("Next", style: TextStyle(fontSize:30),),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    
                    
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterUser()));
                    },
),
                    
                    ],
    
                  
                   
            
                  ))))

              );
              }
}




