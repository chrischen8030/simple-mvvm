import 'package:project/core/base/base_model.dart';
import 'package:project/core/models/firebase_models/choice.dart';
class Question extends BaseModel
{
  final String id;
  String status;
  final List<Choice> choices=[];

  Question({
    required this.id,
    this.status = "ready",
  });

  @override
  void initWithMap(Map<String, Object?> map) {
  
    if (map["status"] is String) {
      this.status = map["status"] as String;
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
    List<Map> choicesList = [];
    for(final object in this.choices){
      choicesList.add(object.toMap());
    }
    map["choice"]= choicesList;
    return map;
  }
}