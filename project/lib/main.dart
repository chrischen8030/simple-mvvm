import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:project/page/home/home.page.dart';
import 'package:firebase_auth/firebase_auth.dart' as fau;

Future<void> main() async {
  await Firebase.initializeApp();
  fau.FirebaseAuth.instance.authStateChanges().listen((fau.User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
