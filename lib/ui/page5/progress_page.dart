import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPage();
}

class _ProgressPage extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("MyWeights").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

                return Row(
                  children: [
                    Expanded(child: Text(documentSnapshot["weightDate"]),),
                    Expanded(child: Text(documentSnapshot["weightUser"]),),
                    Expanded(child: Text(documentSnapshot["weightWeight"]),)
                  ],
                  );
              },
              );
          } else {
            return Align(
              alignment: FractionalOffset.bottomCenter,
              child: CircularProgressIndicator()
              );
          }
        },
        )
    );
  }
}
