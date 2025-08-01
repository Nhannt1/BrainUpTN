import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum SignInStatus {
  success,
  emailNotVerified,
  wrongCredentials,
}

class AuthLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    } catch (e) {
      return 'An error has occurred ';
    }
  }

  Future<SignInStatus> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await _auth.signOut();

        return SignInStatus.emailNotVerified;
      }
      return SignInStatus.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return SignInStatus.wrongCredentials;
      }
      return SignInStatus.wrongCredentials;
    } catch (e) {
      return SignInStatus.wrongCredentials;
    }
  }

  Future<void> signUpSaveUser({
    required String email,
    required String password,
    required String fullname,
    required String phoneNumber,
    required String age,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user!.reload();
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'fullname': fullname,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        'age': age,
        'createdAt': Timestamp.now(),
      });
      print("save user success");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("❌ FirebaseAuthException: ${e.code}");
        rethrow;
      }
    } catch (e) {
      print("❌ Unexpected error: $e");
      rethrow;
    }
  }

  Future<String?> signInwithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return 'Người dùng huỷ đăng nhập';
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user == null) return 'Không lấy được thông tin người dùng';
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (!userDoc.exists) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'fullname': user.displayName ?? 'No name',
          'email': user.email ?? 'email.com',
          'image': user.photoURL ?? '',
          'age': 0,
          'createdAt': Timestamp.now(),
          'achivement': 0,
          'course': 0,
          'totalPoints': 0,
        });
        print("🔥 Google user created in Firestore");
      } else {
        print("✅ Google user already exists");
      }

      return null;
    } catch (e) {
      return 'Lỗi: $e';
    }
  }
}
