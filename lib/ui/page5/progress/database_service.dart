import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../login/pengguna.dart';
import 'weight.dart';

const String TODO_COLLECTION_REF = "MyWeights";

final db_user = FirebaseFirestore.instance;

class DatabaseService {

  reg(int w) async {
      
        final apdetan = Pengguna(
          weight: w,
        );

        final penggunaRef = 
          FirebaseFirestore.instance
          .collection("MyUsers")
          .doc('${FirebaseAuth.instance.currentUser?.email}')
          .withConverter(
            fromFirestore: Pengguna.fromFirestore, 
            toFirestore: (Pengguna penggunaRef, options) => penggunaRef.toFirestore());
          await penggunaRef.set(apdetan, SetOptions(merge: true));
  }

  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _weightsRef;

  DatabaseService(){
    _weightsRef = _firestore
    .collection(TODO_COLLECTION_REF)
    .withConverter<Weight>(fromFirestore: (snapshots, _) => Weight.fromJson(snapshots.data()!,), toFirestore: (weight,_) => weight.toJson());
  }

  Stream<QuerySnapshot> getWeights() {
    return _weightsRef
    .where('weightUser', isEqualTo: "${FirebaseAuth.instance.currentUser?.email}")
    .snapshots();
  }

  void createWeight(Weight weight) async {
    try{
      _weightsRef.add(weight);
      reg(weight.weightWeight);
    } catch(e){
      log(e.toString());
    }
  }

  void updateWeight(String weightId, Weight weight){
    _weightsRef.doc(weightId).update(weight.toJson());

    // langsung update di User

  }

  void deleteWeight(String weightId){
    _weightsRef.doc(weightId).delete();
  }




}