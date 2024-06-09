import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance.collection("MyWeights");

class GoalsPage extends StatefulWidget {

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  var _data;

  @override
  void initState(){
    super.initState();
    getW();
    print(_data);
  }

  void getW(){
    final docRef = db.doc('${FirebaseAuth.instance.currentUser?.email}');
    docRef.get().then(
      (DocumentSnapshot doc) {
        _data = doc.data() as Map<String, dynamic>;
        print("getW : $_data .....");
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

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
          trailing: Text(_data)
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

