import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patient_app/features/auth/model/user_model.dart';
import 'package:patient_app/utils/messages.dart';

import '../../../core/errors/api_error_handler.dart';

class AuthRepository{
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _auth;

  AuthRepository(this._firestore, this._firebaseStorage, this._auth);

  Future<bool> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showMessage('The account already exists for that email.');
      } else{
        showMessage('Error: ${e.message}');
      }
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
    }
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showMessage('Wrong password provided for that user.');
      } else{
        showMessage('Error: ${e.message}');
      }
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
    }
    return false;
  }

  Future<bool> saveUserDetails(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.email).set(user.toJson());
      return true;
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
    }
    return false;
  }

  Future<UserModel?> getUserDetails(String email) async {
    try {
      var user = await _firestore.collection('users').doc(email).get();
      if (user.exists) {
        return UserModel.fromJson(user.data()!);
      }
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
    }
    return null;
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
    }
  }

  Future<bool> isLogged() async {
    try {
      return _auth.currentUser != null;
    } catch (e) {
      print(e);
      var message = ErrorHandler.handleError(e);
      showMessage(message);
      return false;
    }
  }

}