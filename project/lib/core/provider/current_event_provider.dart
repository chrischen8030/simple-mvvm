
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/core/models/firebase_models/question.dart';
import 'package:project/core/util/firebase_firestoroe_util.dart';


/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class CurrentEventProvider with ChangeNotifier,DiagnosticableTreeMixin {
  String? _eid;
  StreamSubscription? _currentSubscription;
  Question? currentQuestion;
  

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
      event.docs.forEach((element) {
        switch(element.id){
          case "question":
            final question = Question(id: element.data()["qid"]);
            question.initWithMap(element.data());
            question.toMap();
            break;
          case "options":
            break;
          case "onlineUsers":
            break;
        }
      });
      notifyListeners();
    });
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}