import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/core/models/firebase_models/event.dart';
import 'package:project/core/models/firebase_models/user.dart';
import 'package:project/core/util/firebase_clound_function_util.dart';

class FirebaseFirestoreUtil {
  static FirebaseFirestoreUtil _instance = FirebaseFirestoreUtil._();
  factory FirebaseFirestoreUtil() {
    return _instance;
  }

  FirebaseFirestoreUtil._();

  FirebaseFirestore get db => FirebaseFirestore.instance;

  Future<LAUser?> get currentUser async {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final laUserRef = db
          .collection("users")
          .doc(uid)
          .withConverter<LAUser>(fromFirestore: (snapshot, option) {
        final map = snapshot.data()!;
        var user = LAUser(uid: uid);
        user.initWithMap(map);
        return user;
      }, toFirestore: (user, option) {
        return user.toMap();
      });
      DocumentSnapshot<LAUser> laUserSnapshot = await laUserRef.get();
      Map nameAndEmailMap = await FirebaseCloundFunctionUtil().rehash();
      final laUser = laUserSnapshot.data();
      laUser!.name = nameAndEmailMap["name"];
      laUser.email = nameAndEmailMap["email"];
      print(laUser.name);
      print(laUser.email);
      return laUser;
    }
    return null;
  }

  Future<List<Event>?> getCurrentUserEvents() async {
    final user = await this.currentUser;
    if(user != null){
      final events = await this.getUserEvents(uid:user.uid);
      return events;
    }
    return null;
  }

  Future<List<Event>> getUserEvents({required String uid}) async {
    final eventsRef = db.collection("enquetes").withConverter<Event>(fromFirestore: (snapshot,option){
      final event = Event(id: snapshot.id);
      event.initWithMap(snapshot.data()!);
      return event;
    }, toFirestore: (event,option){
      return event.toMap();
    });
    List<QueryDocumentSnapshot<Event>> events = await eventsRef.where('uid',isEqualTo: uid).get().then((snapshot){
      return snapshot.docs;
    });
    return events.map<Event>((snapshot){
      return snapshot.data();
    }).toList();
  }
}
