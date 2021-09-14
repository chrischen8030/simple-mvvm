import 'package:flutter/material.dart';

abstract class BaseViewModel with ChangeNotifier {
  Map<String,Object?> toMap();
  void initWithMap(Map<String,Object?> map);
}