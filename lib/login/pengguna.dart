import 'package:cloud_firestore/cloud_firestore.dart';

class Pengguna {
  final String? name;
  final String? email;
  final int? weight;
  final int? height;
  final Timestamp? bornday;
  final String? goal;

  Pengguna({
    this.name,
    this.email,
    this.weight,
    this.height,
    this.bornday,
    this.goal,
  });

  factory Pengguna.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Pengguna(
      name: data?['name'],
      email: data?['email'],
      weight: data?['weight'],
      height: data?['height'],
      bornday: data?['bornday'],
      goal: data?['goal']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (weight != null) "weight": weight,
      if (height != null) "height": height,
      if (bornday != null) "bornday": bornday,
      if (goal != null) "goal": goal,
    };
  }
}