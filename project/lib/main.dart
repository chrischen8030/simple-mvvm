import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:project/page/home/home.page.dart';

Future<void> main() async {
  await Firebase.initializeApp();

  Firestore store = firestore();
  CollectionReference ref = store.collection('test');

  ref.onSnapshot.listen((querySnapshot) {
    querySnapshot.docChanges().forEach((change) {
      if (change.type == "added") {
        print(change.doc.id);
        // Do something with change.doc
      }
    });
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live アンケート',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
