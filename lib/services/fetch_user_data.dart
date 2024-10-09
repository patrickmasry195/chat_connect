import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FetchUserData {
  Future<User?> getCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        log('User logged in: ${user.email}');
        return user;
      } else {
        log('No user is currently logged in.');
      }
    } catch (e) {
      log('Error fetching current user: $e');
    }
    return null;
  }

  Future<Map<String, dynamic>?> getUserDataFromFirestore() async {
    try {
      User? user = await getCurrentUser();
      if (user != null) {
        String uid = user.uid;
        DocumentSnapshot docSnapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (docSnapshot.exists) {
          Map<String, dynamic> userData =
              docSnapshot.data() as Map<String, dynamic>;
          log("User data from Firestore: ${userData.toString()}");
          return userData;
        } else {
          log("No user data found in Firestore for uid: $uid");
        }
      }
    } catch (e) {
      log("Error fetching user data from Firestore: $e");
    }
    return null;
  }

  Future<void> displayUserData() async {
    try {
      User? user = await getCurrentUser();

      if (user == null) {
        log("No current user logged in.");
        return;
      }

      String? email = user.email;
      String? name = user.displayName;
      String? profileImageUrl;

      Map<String, dynamic>? firestoreData = await getUserDataFromFirestore();

      if (name == null &&
          firestoreData != null &&
          firestoreData.containsKey('name')) {
        name = firestoreData['name'];
      }

      if (firestoreData != null &&
          firestoreData.containsKey('profileImageUrl')) {
        profileImageUrl = firestoreData['profileImageUrl'];
      }

      log("User Email: ${email ?? 'No Email'}");
      log("User Name: ${name ?? 'No Name'}");
      log("Profile Image URL: ${profileImageUrl ?? 'No Profile Image'}");
    } catch (e) {
      log("Error displaying user data: $e");
    }
  }
}
