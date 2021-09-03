import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthUtil {
  static FirebaseAuthUtil _instance = FirebaseAuthUtil._();
  factory FirebaseAuthUtil() {
    return _instance;
  }
  FirebaseAuthUtil._();

  //regist by email
  Future<UserCredential> creatUerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(' The password provided is too weak .');
        throw(' The password provided is too weak .');
      } else if (e.code == 'email-already-in-user') {
        print('The account already exists for that email.');
        throw('The account already exists for that email.');
      }
      throw ('creatUerWithEmailAndPassword has a error');
    } catch (e) {
      print(e);
      throw e;
    }
  }

   //login by email
   Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email:email,
              password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw ('Wrong password provided for that user.');
      }
      throw ('firebase login has a error.');
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user == null){
      throw(' sendEmailVerification faild! please login! ');
    }
    if(user.emailVerified){
       throw(' sendEmailVerification faild! user has do emailVerified! ');
    }
    await user.sendEmailVerification();
  }

  
}
