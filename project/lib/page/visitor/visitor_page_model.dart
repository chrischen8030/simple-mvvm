import 'package:project/core/base/base_view_model.dart';
import 'package:project/core/provider/current_event_provider.dart';

class VisitorPageModel extends BaseViewModel {

  final current = CurrentEventProvider();

  VisitorPageModel(){
    current.addListener(() {
      print("=============recall VisitorPageModel");
      notifyListeners();
    });
  }

  String? get state=>this.current.currentQuestion!.status;
  String? get title=>this.current.currentQuestion!.title;
  String? get stateTitle  {
    return this.current.visitorSetting!.deadline;
  }
  String? get type  {
    return this.current.currentQuestion!.type;
  }

  List<String> get selectValues {
    final List<String> values = [];
    final choices = current.currentQuestion!.choices;
    for(final choice in choices){
      values.add(choice.value);
    }
    return values;
  }

}