import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUser {
  Future<void> updateUserName(String userId, String newName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      await users.doc(userId).update({
        'name': newName,
      });
      log("User name updated successfully!");
    } catch (e) {
      log("Error updating user name: $e");
    }
  }
}
