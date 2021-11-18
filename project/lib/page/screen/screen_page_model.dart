import 'package:project/core/base/base_view_model.dart';
import 'package:project/core/models/firebase_models/choice.dart';
import 'package:project/core/provider/current_event_provider.dart';

class ScreenPageModel extends BaseViewModel {
  final current = CurrentEventProvider();

  ScreenPageModel() {
    current.addListener(() {
      print("=============recall ScreenPageModel");
      notifyListeners();
    });
  }

  String? get state => this.current.currentQuestion!.status;
  String? get title => this.current.currentQuestion!.title;
  List<Choice> get choiceRankList {
    if (this.current.currentQuestion != null) {
      final List<Choice> list =
          List.from(this.current.currentQuestion!.choices);
      list.sort((a, b) => b.voteTotal - a.voteTotal);
      return list;
    }
    return [];
  }

  String? get stateTitle {
    return this.current.visitorSetting!.deadline;
  }

  String? get type {
    return this.current.currentQuestion!.type;
  }

  List<String> get selectValues {
    final List<String> values = [];
    final choices = current.currentQuestion!.choices;
    for (final choice in choices) {
      values.add(choice.value);
    }
    return values;
  }
}
