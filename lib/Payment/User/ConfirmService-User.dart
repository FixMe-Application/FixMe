import 'package:flutter/material.dart';


void main() => runApp(MyApp());

void confirmd(){

}


class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Confirm',
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
        title:Text("Order Confirm", style:TextStyle(fontSize: 25), textAlign: TextAlign.center,)
      ),
      body: Container(
       
        decoration: BoxDecoration( border:Border.all(color: Colors.blueAccent)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              ),
            DecoratedBox(
            
              decoration: BoxDecoration( border:Border.all(color: Colors.blueAccent, style: BorderStyle.solid,  width: 2.0) ),
              child:Container(
                 padding: EdgeInsets.all(10),
                child:Text("Basic Charge                   Rs.850.00", style:TextStyle(fontSize: 25, shadows: []), textAlign: TextAlign.center,),
              ),
              
              ),
            
            Container(
              margin: EdgeInsets.all(10),
              ),

            Text("Full Service Charge will depend on the service gain by the mechanic you selected", style: TextStyle(fontSize:20),textAlign: TextAlign.center,),
            RaisedButton(
              child:Text("Confirm", style:TextStyle(color: Colors.white,fontSize: 20.0)),
              color: Theme.of(context).primaryColor,
              onPressed: confirmd
            )

          ],
          
      ),),
      
    );
}

}


