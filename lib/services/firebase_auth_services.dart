import 'package:chat_connect/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailPassword(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await saveUserToFirestore(userModel, user.uid);
      }

      return user;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> saveUserToFirestore(UserModel userModel, String uid) async {
    Map<String, dynamic> userData = userModel.toJson();
    userData['id'] = uid;

    await _firestore.collection('users').doc(uid).set(userData);
  }

  Future<String?> signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else {
        return 'Something went wrong. Please restart app.';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
