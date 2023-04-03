import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/helper/helper_function.dart';
import 'package:flutter_chat_app/services/database_services.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// Register :
  Future registerUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // here we call our database service to update the user data
        await DatabaseService(uid: user.uid).saveUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Login
  Future loginWithUserNameAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Logging out :
  Future Logout() async {
    try {
      await HelperFuncitons.saveUserLoggedInStatus(false);
      await HelperFuncitons.saveUserEmailSF("");
      await HelperFuncitons.saveUserEmailSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
