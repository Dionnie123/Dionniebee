import 'dart:async';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/models/user_dto.dart';
import 'package:dionniebee/firebase_options.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@LazySingleton()
class FirebaseAuthService with InitializableDependency implements AuthService {
  final _log = getLogger('FirebaseAuthService');
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();

  FirebaseAuth? _firebaseAuth;
  FirebaseStorage? _firebaseStorage;

  String? imagePath(String val) => _firebaseStorage?.refFromURL(val).fullPath;

  @override
  Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _firebaseAuth = FirebaseAuth.instance;

      _firebaseStorage = FirebaseStorage.instance;

      final user = _firebaseAuth?.currentUser;
      if (user != null) {
        _userService.currentUser = UserDto(id: user.uid, email: user.email);
      }
      _log.i('Initialized');
    } catch (e) {
      _log.e('Initialized Failed: ${e.toString()}');
    }
  }

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = (await _firebaseAuth?.signInWithEmailAndPassword(
              email: email, password: password))
          ?.user;
      if (user != null) {
        _userService.currentUser = UserDto(id: user.uid, email: user.email);
      }
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
      await _firebaseAuth?.createUserWithEmailAndPassword(
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
      await _firebaseAuth?.sendPasswordResetEmail(email: email);
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
      await _firebaseAuth?.signOut();
      _userService.currentUser = null;
    } catch (e) {
      _log.e(e.toString());
      await _dialogService.showDialog(
        title: "Sign-out Error",
        description: e.toString(),
      );
    }
  }

  @override
  Future signInAnonymously() async {
    try {
      final user = (await _firebaseAuth?.signInAnonymously())?.user;
      if (user != null) {
        _userService.currentUser = UserDto(id: user.uid, email: user.email);
      }
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
    _firebaseAuth?.app.delete();
  }
}
