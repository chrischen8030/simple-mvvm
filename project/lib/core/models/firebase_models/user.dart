import 'package:project/core/base/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LAUser extends BaseModel
{
  final String uid;
  String? name;
  String? email;
  DateTime? updated;

  LAUser({
    required this.uid,
    this.name,
    this.email,
    this.updated,
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["name"] is String) {
      this.name = map["name"] as String;
    }

    if (map["email"] is String) {
      this.email = map["email"] as String;
    }

    if (map["updated"] is DateTime) {
      this.updated = (map["updated"] as Timestamp).toDate();
    }

  }

  @override
  Map<String, Object?> toMap() {
     final map = Map<String, Object?>();
    map["name"] = this.name!;
    map["email"] = this.email!;
    map["updated"] = Timestamp.fromDate(this.updated ?? DateTime.now());
     return map;
  }
}