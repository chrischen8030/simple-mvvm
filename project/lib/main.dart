import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:project/core/provider/current_event_provider.dart';
import 'package:project/page/visitor/visitor_page.dart';

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
    final currentEventProvider = CurrentEventProvider();
    currentEventProvider.eid = 't1pxRHiHUHnucUAhh2Bh';
    return MaterialApp(
      title: 'Live アンケート',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: VisitorPage(),
      home: VisitorPage(),
    );
  }
}
