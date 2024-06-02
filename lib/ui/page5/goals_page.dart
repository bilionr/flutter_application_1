import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goals"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
      children: <Widget>[
        
        const Divider(height:0),

        ListTile(
          title: Text("Starting weight"),
          trailing: Text("yyyy")
        ),

        const Divider(height:0),

        ListTile(
          title: Text("Current weight"),
          trailing: Text("yyyy"),
        ),

        const Divider(height:0),

        ListTile(
          title: Text("Goal weight"),
          trailing: Text("yyy"),
        ),

        const Divider(height:0),

      ]
    ),
    );
  }
}

