import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'progressdashboard.dart';
import 'database_service.dart';

import 'weight.dart';

class addWeight extends StatelessWidget {

  final DatabaseService _databaseService = DatabaseService();

  static const routeName = "/add-weight";

  final _weightDate = Timestamp.now();
  final TextEditingController _weightWeight = TextEditingController();
  final TextEditingController _weightUser = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD WEIGHT"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                readOnly: true,
                initialValue: FirebaseAuth.instance.currentUser?.email,
                decoration: InputDecoration(labelText: "weightUser",hintText: FirebaseAuth.instance.currentUser?.email),
              ),
              TextFormField(
                autofocus: true,
                autocorrect: false,
                decoration: InputDecoration(labelText: "weightWeight"),
                textInputAction: TextInputAction.next,
                controller: _weightWeight,
              ),
              TextFormField(
                autocorrect: false,
                readOnly: true,
                initialValue: Timestamp.now().toString(),
                decoration: 
                  InputDecoration(labelText: "weightDate",
                  hintText: _weightDate.toString()),
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    Weight w = Weight(
                      weightDate: Timestamp.now(), 
                      weightUser: FirebaseAuth.instance.currentUser?.email as String, 
                      weightWeight: int.parse(_weightWeight.text)
                    );
                    
                    _databaseService.createWeight(w);
                    Navigator.pop(context);
                    },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}