import 'package:project/core/base/base_model.dart';

class VisitorSetting extends BaseModel {
  String active; //受付中
  bool showsAd;
  String deadline; //受付終了
  String closesOtherAsk; //他の参加表示しない
  String nores; //受付中
  bool allowsDialogMode;
  String sort;

  VisitorSetting(
    this.active,
    this.showsAd,
    this.deadline,
    this.closesOtherAsk,
    this.nores,
    this.allowsDialogMode,
    this.sort,
  );
  @override
  void initWithMap(Map<String, Object?> map) {
    // TODO: implement initWithMap
  }

  @override
  Map<String, Object?> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
