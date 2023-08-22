import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

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
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
    return "";
    
  }

  Future<void> signOut()async{
    await _firebaseAuth.signOut();
  }
}