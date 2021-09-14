import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/core/base/base_model.dart';
class Event extends BaseModel
{
  final String id;
  String liveDate;
  String liveTime;
  bool isArchive;
  bool isPublic;
  DateTime? created;
  int questionCount;
  String title;
  bool showsEvent;
  String uid;
  int passcode;
  String hash;

  Event({
    required this.id,
    this.liveDate = "",
    this.liveTime = "",
    this.isArchive = true,
    this.isPublic = true,
    this.created,
    this.questionCount = 0,
    this.title = "",
    this.showsEvent = true,
    this.uid = "",
    this.passcode = 0,
    this.hash = "",
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["liveDate"] is String) {
      this.liveDate = map["liveDate"] as String;
    }

    if (map["liveTime"] is String) {
      this.liveTime = map["liveTime"] as String;
    }

    if (map["isArchive"] is bool) {
      this.isArchive = map["isArchive"] as bool;
    }

    if (map["isPublic"] is bool) {
      this.isPublic = map["isPublic"] as bool;
    }

    if (map["created"] is Timestamp) {
      this.created = (map["created"] as Timestamp).toDate();
    }

    if (map["questionCount"] is int) {
      this.questionCount = map["questionCount"] as int;
    }

    if (map["title"] is String) {
      this.title = map["title"] as String;
    }

    if (map["showsEvent"] is bool) {
      this.showsEvent = map["showsEvent"] as bool;
    }

    if (map["uid"] is String) {
      this.uid = map["uid"] as String;
    }

    if (map["passcode"] is int) {
      this.passcode = map["passcode"] as int;
    }

    if (map["hash"] is String) {
      this.hash = map["hash"] as String;
    }

  }

  @override
  Map<String, Object?> toMap() {
    final map = Map<String, Object?>();
    map["liveDate"] = this.liveDate;
    map["liveTime"] = this.liveTime;
    map["isArchive"] = this.isArchive;
    map["isPublic"] = this.isPublic;
    map["created"] = Timestamp.fromDate(this.created ?? DateTime.now());
    map["questionCount"] = this.questionCount;
    map["title"] = this.title;
    map["showsEvent"] = this.showsEvent;
    map["uid"] = this.uid;
    map["passcode"] = this.passcode;
    map["hash"] = this.hash;
    return map;
  }
}