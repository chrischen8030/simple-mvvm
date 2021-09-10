import 'package:cloud_functions/cloud_functions.dart';

class FirebaseCloundFunctionUtil {
  FirebaseCloundFunctionUtil._();
  static FirebaseCloundFunctionUtil _instance = FirebaseCloundFunctionUtil._();
  factory FirebaseCloundFunctionUtil(){
    return _instance;
  }


Future<Map> rehash() async {
  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('rehash');
  final results = await callable();
  Map userData = results.data;
  return userData;
}


}