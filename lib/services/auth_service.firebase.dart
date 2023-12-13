import 'dart:async';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/constants/firebase_options.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_user;
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class FirebaseAuthService with InitializableDependency implements AuthService {
  late FirebaseAuth _firebaseAuth;
  late StreamSubscription<firebase_user.User?> streamSubscription;
  final _log = getLogger('FirebaseAuthService');
  final _dialogService = locator<DialogService>();

  firebase_user.User? _user;

  @override
  init() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      _firebaseAuth = FirebaseAuth.instance;
      _authStateChanges();
      _log.d('Initialized');
    } catch (e) {
      _log.e('Initialized Failed');
    }
  }

  void _authStateChanges() {
    streamSubscription =
        _firebaseAuth.authStateChanges().listen((firebase_user.User? user) {
      if (user != null) {}
    });
  }

  @override
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
          title: "Sign-in Error",
          description: e.toString(),
          dialogPlatform: DialogPlatform.Custom);
    } catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
          title: "Sign-in Error",
          description: e.toString(),
          dialogPlatform: DialogPlatform.Custom);
    }
  }

  @override
  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
        title: "Sign-up Error",
        description: e.toString(),
      );
    } catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
        title: "Sign-up Error",
        description: e.toString(),
      );
    }
  }

  @override
  Future resetPassword({required String password}) async {}

  @override
  Future resetPasswordRequest({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
        title: "Reset Password Error",
        description: e.toString(),
      );
    }
  }

  @override
  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
        title: "Sign-out Error",
        description: e.toString(),
      );
    }
  }

  @override
  get user => _user;

  @override
  Future signInAnonymously() async {
    try {
      _user = (await _firebaseAuth.signInAnonymously()).user;
      updateUser(user);
    } on FirebaseAuthException catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
        title: "Anonymous Sign-in Error",
        description: e.toString(),
      );
    }
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    _firebaseAuth.app.delete();
  }

  @override
  void updateUser(user) {
    _user = user;
  }
}
