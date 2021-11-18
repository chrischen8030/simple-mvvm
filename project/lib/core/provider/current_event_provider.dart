
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/core/models/firebase_models/question.dart';
import 'package:project/core/models/firebase_models/screen_setting.dart';
import 'package:project/core/models/firebase_models/visitor_setting.dart';
import 'package:project/core/util/firebase_firestoroe_util.dart';


/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class CurrentEventProvider with ChangeNotifier,DiagnosticableTreeMixin {
  String? _eid;
  StreamSubscription? _currentSubscription;
  StreamSubscription? _currentQuestionSubscription;
  Question? currentQuestion;
  ScreenSetting? screenSetting;
  VisitorSetting? visitorSetting;
  
  CurrentEventProvider._();
  static CurrentEventProvider _instance = CurrentEventProvider._();
  factory CurrentEventProvider(){
    return _instance;
  }

  set eid(String eid){
    if(_eid != eid){
      _eid = eid;
      _changeSnapshot();
    }
  }

  void _changeSnapshot(){
    final collection = FirebaseFirestoreUtil().db.collection("/enquetes/$_eid/currents");
    if(_currentSubscription != null){
      _currentSubscription!.cancel();
    }
    _currentSubscription = collection.snapshots().listen((event) {
      event.docChanges.forEach((element) {
        switch(element.doc.id){
          case "question":
            print("==============question1:${element.doc.id}================");
            final question = Question(id: element.doc.data()!["qid"] ?? "");
            question.initWithMap(element.doc.data()!);
            if(this.currentQuestion == null || this.currentQuestion!.id != question.id){
              this.currentQuestion = question;
              this.startCurrentListener();
            }else{
              this.currentQuestion = question;
            }
            print("========${question.status}");
            notifyListeners();
            break;
          case "options":
            print("==============options1:${element.doc.id}================");
            final optionsData = element.doc.data();
            final visitorSettingData = optionsData?.map((key, value){
              if(value is Map){
                final map = value;
                if(map.keys.contains("vote")){
                  return MapEntry(key, map["vote"]);
                }
                if(map.keys.contains("screen")){
                  return MapEntry(key, "no vote");
                }
              }
              return MapEntry(key, value);
            });
            final screenSettingData = optionsData?.map((key, value){
              if(value is Map){
                final map = value;
                if(map.keys.contains("screen")){
                  return MapEntry(key, map["screen"]);
                }
                if(map.keys.contains("vote")){
                  return MapEntry(key, "no screen");
                }
              }
              return MapEntry(key, value);
            });
            this.screenSetting = ScreenSetting();
            this.screenSetting!.initWithMap(screenSettingData??Map());
            this.visitorSetting = VisitorSetting();
            this.visitorSetting!.initWithMap(visitorSettingData??Map());
            notifyListeners();
            break;
          case "onlineUsers":
            print("==============onlineUsers1:${element.doc.id}================");
            break;
        }
      });
    });
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

  void startCurrentListener(){
    _currentQuestionSubscription?.cancel();
    final collection = FirebaseFirestoreUtil().db.collection("/enquetes/${_eid}/results/${this.currentQuestion!.id}/voteResult");
    _currentQuestionSubscription = collection.snapshots().listen((event) {
      final docs = event.docs;
      print('event.docs:${event.docs.length}');

      int total = 0;
      this.currentQuestion!.choices.forEach((element) {
          element.voteTotal = 0;
      });
      docs.forEach((element) { 
        final idStr = element.id;
        final choiceIdStr = idStr.split('_').first;
        final choice = this.currentQuestion!.choices.firstWhere((element) => element.id == choiceIdStr);
        choice.voteTotal +=  element.data()['total'] as int;
        total +=  element.data()['total'] as int;
      });
      print('question.choices:${this.currentQuestion!.choices.length}');
      this.currentQuestion!.choices.forEach((element) {
        final percent = ((element.voteTotal/total)*100).round();
        element.totalPercent = percent;
        print('${element.value}:${element.totalPercent}');
      });
      notifyListeners();
    });

  }
}