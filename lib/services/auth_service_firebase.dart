import 'package:dionniebee/app/helpers/error_definitions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser;

enum SupabaseAuthEvent {
  signedIn,
  signedOut,
  tokenRefreshed,
  userUpdated,
  passwordRecovery
}

class AuthService with Initialisable {
  late SupabaseClient _supabase;

  late FirebaseAuth _firebaseAuth;

  @override
  Future<void> initialise() async {
    await Firebase.initializeApp();
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    _supabase = Supabase.instance.client;
    _firebaseAuth = FirebaseAuth.instance;
  }

  AuthService() {
    _firebaseAuth.authStateChanges().listen((firebaseUser.User? user) {
      if (user != null) {
        print(user.uid);
      }
    });
  }

  Future signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      return await Future.error(errorDefinition(e.toString()));
    }
  }

  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      return await Future.error(errorDefinition(e.toString()));
    }
  }

  Future resetPassword({required String password}) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(password: password));
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  Future resetPasswordRequest({required String email}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
        //The URL to redirect the user to when clicking on the link on the confirmation link after signing up
        redirectTo: "https://boxtout.com/",
      );
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  Future signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  get user => _supabase.auth.currentUser;
}
