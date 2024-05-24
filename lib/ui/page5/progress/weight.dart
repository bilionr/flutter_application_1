import 'package:cloud_firestore/cloud_firestore.dart';

class Weight{
  String weightUser;
  int weightWeight;
  Timestamp weightDate;

  Weight({
    required this.weightDate, 
    required this.weightWeight, 
    required this.weightUser
  });

  Weight.fromJson(Map<String, Object?> json) 
    : this(
      weightDate: json['weightDate'] as Timestamp,
      weightUser: json['weightUser'] as String,
      weightWeight: json['weightWeight'] as int
    );

  Weight copyWith({
    Timestamp? weightDate,
    String? weightUser,
    int? weightWeight,
  }) {
    return Weight(
      weightDate: weightDate ?? this.weightDate,
      weightUser: weightUser ?? this.weightUser,
      weightWeight: weightWeight ?? this.weightWeight
    );
  }

  Map<String, Object?> toJson() {
    return {
      'weightDate': weightDate,
      'weightUser': weightUser,
      'weightWeight': weightWeight,
    };
  }

}
