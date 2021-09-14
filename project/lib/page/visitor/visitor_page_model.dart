import 'package:project/core/base/base_view_model.dart';
import 'package:project/core/models/firebase_models/question.dart';

class VisitorPageModel extends BaseViewModel {

  Question? _question;

  set question(Question? question){
    _question = question;
    notifyListeners();
  }

  Question? get question => _question;

  @override
  void initWithMap(Map<String, Object?> map) {
  }

  @override
  Map<String, Object?> toMap() {
    throw UnimplementedError();
  }
  
}