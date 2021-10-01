import 'package:project/core/base/base_model.dart';
import 'package:project/core/models/firebase_models/choice.dart';
class Question extends BaseModel
{
  final String id;
  String status;
  String title;
  String type;
  String uid;
  int priority;
  int multiVoteLimit;
  String resultDisplay;
  final List<Choice> choices=[];

  Question({
    required this.id,
    this.status = "ready",
    this.title = "",
    this.type = "",
    this.uid = "",
    this.priority = 1,
    this.multiVoteLimit = 1,
    this.resultDisplay = "show",
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["status"] is String) {
      this.status = map["status"] as String;
    }

    if (map["title"] is String) {
      this.title = map["title"] as String;
    }

    if (map["type"] is String) {
      this.type = map["type"] as String;
    }

    if (map["uid"] is String) {
      this.uid = map["uid"] as String;
    }

    if (map["priority"] is int) {
      this.priority = map["priority"] as int;
    }

    if (map["multiVoteLimit"] is int) {
      this.multiVoteLimit = map["multiVoteLimit"] as int;
    }

    if (map["resultDisplay"] is String) {
      this.resultDisplay = map["resultDisplay"] as String;
    }

    if (map["choice"] is List) {
      final Object? choicesDatas = map["choice"];
      for(final choicesData in choicesDatas as List){
        this.choices.add(Choice(id: choicesData["cid"],)..initWithMap(choicesData));
      }
    }

  }

  @override
  Map<String, Object?> toMap() {
    final map = Map<String, Object?>();
    map["status"] = this.status;
    map["title"] = this.title;
    map["type"] = this.type;
    map["uid"] = this.uid;
    map["priority"] = this.priority;
    map["multiVoteLimit"] = this.multiVoteLimit;
    map["resultDisplay"] = this.resultDisplay;
    List<Map> choicesList = [];
    for(final object in this.choices){
      choicesList.add(object.toMap());
    }
    map["choice"]= choicesList;
    return map;
  }
}