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
        title:Text("Your Service Charge", style:TextStyle(fontSize: 25), textAlign: TextAlign.center,)
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
                child:Text("Full Payment                  Rs.8050.00", style:TextStyle(fontSize: 25, shadows: []), textAlign: TextAlign.center,),
              ),
              
              ),
            
            Container( 
              child:Text("Quantity  (Petrol):                        20L", style:TextStyle(fontSize: 25, shadows: []), textAlign: TextAlign.start,),
              margin: EdgeInsets.all(10),
              ),

            
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


