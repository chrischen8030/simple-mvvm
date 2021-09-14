
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
      notifyListeners();
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
            this.currentQuestion = question;
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
}