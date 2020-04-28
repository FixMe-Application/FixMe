import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  TasksPage({Key key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
           leading: IconButton(
             icon: Icon(
               Icons.arrow_back,
               color: Colors.white,
             ),
             onPressed: (){

             },
           ),
         title: Text(
           "My Tasks",
           style: TextStyle(
             fontSize: 20.0,
             color:Colors.white
           ),
         ),
       ),
       body: DefaultTabController(
         length: 3,
         child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                tabs: [
                Tab(text: "All"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled")
              ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  Container(
                    child: Text("All Body"),
                  ),
                  Container(
                    child: Text("Completed Body"),
                  ),
                  Container(
                    child: Text("Cancelled Body"),
                  ),
                ]),
              ),
            )
          ],
        ),
       ),
    );
  }
}