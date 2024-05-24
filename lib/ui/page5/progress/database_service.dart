import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'weight.dart';

const String TODO_COLLECTION_REF = "MyWeights";

class DatabaseService {

  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _weightsRef;

  DatabaseService(){
    _weightsRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Weight>(fromFirestore: (snapshots, _) => Weight.fromJson(snapshots.data()!,), toFirestore: (weight,_) => weight.toJson());
  }

  Stream<QuerySnapshot> getWeights() {
    return _weightsRef.snapshots();
  }

  void createWeight(Weight weight) async {
    print("created");
    try{
      _weightsRef.add(weight);
    } catch(e){
      log(e.toString());
    }
  }

  void updateWeight(String weightId, Weight weight){
    _weightsRef.doc(weightId).update(weight.toJson());
  }

  void deleteWeight(String weightId){
    _weightsRef.doc(weightId).delete();
  }




}