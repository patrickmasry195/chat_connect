import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String profileImageUrl,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await _firestore.collection("users").doc(credential.user!.uid).set({
          "name": name,
          "email": email,
          "uid": credential.user!.uid,
          "profileImageUrl": profileImageUrl,
        });
        res = "success";
      } else {
        res = "Please fill in all fields.";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields.";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
        log("Google user signed out.");
      }

      log("User signed out from Firebase.");
    } catch (e) {
      log("Error signing out: $e");
    }
  }

  Future<void> deleteUserAndData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userId = user.uid;

      try {
        await user.delete();
        log('User deleted from Firebase Auth');

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .delete();
        log('User data deleted from Firestore');

        final storageRef =
            FirebaseStorage.instance.ref().child('profile_images/$userId');
        await storageRef.listAll().then((result) {
          for (var item in result.items) {
            item.delete();
          }
        });
        log('User files deleted from Cloud Storage');
      } catch (e) {
        log('Error deleting user and data: $e');
      }
    } else {
      log('No user is currently signed in.');
    }
  }
}
