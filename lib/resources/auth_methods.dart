import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // sign up User
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    // required Uint8List file
  }) async {
    String response = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty
          // file != null
          ) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(credential.user!.uid);
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'email': 'email',
          'bio': '',
          'followers': [],
          'following': [],
        });
        response = "success";

        // another way
        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': credential.user!.uid,
        //   'email': 'email',
        //   'bio': '',
        //   'followers': [],
        //   'following': [],
        // });
      }
    } catch (err) {
      response = err.toString();
    }
    return response;
  }
}
