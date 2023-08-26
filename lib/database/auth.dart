import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  final db = FirebaseFirestore.instance;
  final users = FirebaseFirestore.instance.collection('users');

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
    return "";
  }

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  })async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      Future.delayed(const Duration(seconds: 1));
      db.collection("users").doc(currentUser!.uid.toString()).set({
        "username": username,
        "profileurl": "",
        "bio": "empty",
      });
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
    return "";
    
  }

  Future<void> updateData(Map<String, dynamic> changes) async{
    await users.doc(currentUser!.uid).update(changes)
      .then((value) => print('Changed data successfully'))
      .catchError((error)=> print(error.toString()));
  }

  Future<void> signOut()async{
    await _firebaseAuth.signOut();
  }
}