import 'package:dionniebee/firebase_options.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser;

class FirebaseAuthService with Initialisable implements AuthService {
  late FirebaseAuth _firebaseAuth;

  @override
  Future<void> initialise() async {
    print('initialize');
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    _firebaseAuth = FirebaseAuth.instance;

    _firebaseAuth.authStateChanges().listen((firebaseUser.User? user) {
      if (user != null) {
        print(user.uid);
      }
    });
  }

  @override
  Future signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.value(e.toString());
      } else if (e.code == 'wrong-password') {
        return Future.value(e.toString());
      }
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  @override
  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.value(e.toString());
      } else if (e.code == 'email-already-in-use') {
        return Future.value(e.toString());
      }
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  @override
  Future resetPassword({required String password}) async {}

  @override
  Future resetPasswordRequest({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  @override
  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  @override
  get user => _firebaseAuth.currentUser;
}
