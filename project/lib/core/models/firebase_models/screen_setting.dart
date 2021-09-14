import 'package:project/core/base/base_model.dart';
class ScreenSetting extends BaseModel
{
  String active;
  bool showsAd;
  String deadline;
  String closesOtherAsk;
  String nores;
  bool allowsDialogMode;
  String sort;

  ScreenSetting({
    this.active = "",
    this.showsAd = true,
    this.deadline = "",
    this.closesOtherAsk = "",
    this.nores = "",
    this.allowsDialogMode = true,
    this.sort = "",
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["active"] is String) {
      this.active = map["active"] as String;
    }

    if (map["showsAd"] is bool) {
      this.showsAd = map["showsAd"] as bool;
    }

    if (map["deadline"] is String) {
      this.deadline = map["deadline"] as String;
    }

    if (map["closesOtherAsk"] is String) {
      this.closesOtherAsk = map["closesOtherAsk"] as String;
    }

    if (map["nores"] is String) {
      this.nores = map["nores"] as String;
    }

    if (map["allowsDialogMode"] is bool) {
      this.allowsDialogMode = map["allowsDialogMode"] as bool;
    }

    if (map["sort"] is String) {
      this.sort = map["sort"] as String;
    }

  }

  @override
  Map<String, Object?> toMap() {
    final map = Map<String, Object?>();
    map["active"] = this.active;
    map["showsAd"] = this.showsAd;
    map["deadline"] = this.deadline;
    map["closesOtherAsk"] = this.closesOtherAsk;
    map["nores"] = this.nores;
    map["allowsDialogMode"] = this.allowsDialogMode;
    map["sort"] = this.sort;
    return map;
  }
}