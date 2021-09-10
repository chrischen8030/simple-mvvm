import 'package:project/core/base/base_model.dart';
class VoteLimit extends BaseModel
{
  bool? enable;
  int? num;
  String? str;

  VoteLimit({
    this.enable,
    this.num,
    this.str,
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["enable"] is bool) {
      this.enable = map["enable"] as bool;
    }

    if (map["num"] is int) {
      this.num = map["num"] as int;
    }

    if (map["str"] is String) {
      this.str = map["str"] as String;
    }

  }

  @override
  Map<String, Object?> toMap() {
     final map = Map<String, Object?>();
    map["enable"] = this.enable!;
    map["num"] = this.num!;
    map["str"] = this.str!;
     return map;
  }
}