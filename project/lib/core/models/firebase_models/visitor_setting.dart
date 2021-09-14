import 'package:project/core/base/base_model.dart';
import 'package:project/core/models/firebase_models/vote_limit.dart';
class VisitorSetting extends BaseModel
{
  String? active;
  bool addsBadButton;
  String cssFile;
  String deadline;
  int iframeHeight;
  String? iframeUrl;
  String? inlineCss;
  bool? isAuthenticated;
  bool? logoDisable;
  String? nores;
  String? ready;
  bool? showsAd;
  bool? showsTranslation;
  String? wait;
  VoteLimit? voteLimit;

  VisitorSetting({
    this.active,
    this.addsBadButton = true,
    this.cssFile = "",
    this.deadline = "",
    this.iframeHeight = 0,
    this.iframeUrl,
    this.inlineCss,
    this.isAuthenticated,
    this.logoDisable,
    this.nores,
    this.ready,
    this.showsAd,
    this.showsTranslation,
    this.wait,
    this.voteLimit,
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

    if (map["isAuthenticated"] is bool) {
      this.isAuthenticated = map["isAuthenticated"] as bool;
    }

    if (map["logoDisable"] is bool) {
      this.logoDisable = map["logoDisable"] as bool;
    }

    if (map["nores"] is String) {
      this.nores = map["nores"] as String;
    }

    if (map["ready"] is String) {
      this.ready = map["ready"] as String;
    }

    if (map["showsAd"] is bool) {
      this.showsAd = map["showsAd"] as bool;
    }

    if (map["showsTranslation"] is bool) {
      this.showsTranslation = map["showsTranslation"] as bool;
    }

    if (map["wait"] is String) {
      this.wait = map["wait"] as String;
    }

    if (map["voteLimit"] is Map) {
      this.voteLimit = VoteLimit()..initWithMap(map["voteLimit"] as Map<String,Object?>);
    }

  }

  @override
  Map<String, Object?> toMap() {
    final map = Map<String, Object?>();
    map["active"] = this.active!;
    map["addsBadButton"] = this.addsBadButton;
    map["cssFile"] = this.cssFile;
    map["deadline"] = this.deadline;
    map["iframeHeight"] = this.iframeHeight;
    map["iframeUrl"] = this.iframeUrl!;
    map["inlineCss"] = this.inlineCss!;
    map["isAuthenticated"] = this.isAuthenticated!;
    map["logoDisable"] = this.logoDisable!;
    map["nores"] = this.nores!;
    map["ready"] = this.ready!;
    map["showsAd"] = this.showsAd!;
    map["showsTranslation"] = this.showsTranslation!;
    map["wait"] = this.wait!;
    map["voteLimit"] = this.voteLimit!.toMap();
    return map;
  }
}