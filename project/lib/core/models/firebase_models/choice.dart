import 'package:project/core/base/base_model.dart';
class Choice extends BaseModel
{
  final String id;
  int priority;
  String value;
  String uid;

  Choice({
    required this.id,
    this.priority = 0,
    this.value = "",
    this.uid = "",
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["priority"] is int) {
      this.priority = map["priority"] as int;
    }

    if (map["value"] is String) {
      this.value = map["value"] as String;
    }

    if (map["uid"] is String) {
      this.uid = map["uid"] as String;
    }

  }

  @override
  Map<String, Object?> toMap() {
    final map = Map<String, Object?>();
    map["priority"] = this.priority;
    map["value"] = this.value;
    map["uid"] = this.uid;
    return map;
  }
}