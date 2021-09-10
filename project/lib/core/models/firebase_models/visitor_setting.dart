import 'package:project/core/base/base_model.dart';
class VisitorSetting extends BaseModel
{
  String? active;
  bool addsBadButton;
  String cssFile;
  String deadline;
  int iframeHeight;
  String? iframeUrl;
  String? inlineCss;

  VisitorSetting({
    this.active,
    this.addsBadButton = true,
    this.cssFile = "",
    this.deadline = "",
    this.iframeHeight = 0,
    this.iframeUrl,
    this.inlineCss,
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["active"] is String) {
      this.active = map["active"] as String;
    }

    if (map["addsBadButton"] is bool) {
      this.addsBadButton = map["addsBadButton"] as bool;
    }

    if (map["cssFile"] is String) {
      this.cssFile = map["cssFile"] as String;
    }

    if (map["deadline"] is String) {
      this.deadline = map["deadline"] as String;
    }

    if (map["iframeHeight"] is int) {
      this.iframeHeight = map["iframeHeight"] as int;
    }

    if (map["iframeUrl"] is String) {
      this.iframeUrl = map["iframeUrl"] as String;
    }

    if (map["inlineCss"] is String) {
      this.inlineCss = map["inlineCss"] as String;
    }

  }

  @override
  Map<String, Object?> toMap() {
     final map = Map<String, Object?>();
    map["active"] = this.active;
    map["addsBadButton"] = this.addsBadButton;
    map["cssFile"] = this.cssFile;
    map["deadline"] = this.deadline;
    map["iframeHeight"] = this.iframeHeight;
    map["iframeUrl"] = this.iframeUrl;
    map["inlineCss"] = this.inlineCss;
     return map;
  }
}