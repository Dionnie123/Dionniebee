import 'package:dionniebee/app/helpers/error_definitions.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SupabaseAuthEvent {
  signedIn,
  signedOut,
  tokenRefreshed,
  userUpdated,
  passwordRecovery
}

class AuthService with Initialisable {
  late SupabaseClient _supabase;

  @override
  Future<void> initialise() async {
    await Supabase.initialize(
      url: "https://zxjwzmhlvkxtqvynuhzc.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp4and6bWhsdmt4dHF2eW51aHpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAzODA2MDEsImV4cCI6MjAwNTk1NjYwMX0.20rPk4V8N4NLJ1o2QpsDonVUXinynPlNWHi7kOL5vLg",
    );

    _supabase = Supabase.instance.client;
  }

  AuthService() {
/*     _supabase.auth.onAuthStateChange.listen((state) async {
      if (state.event.name == SupabaseAuthEvent.passwordRecovery.name) {
        //Go to Password Reset Route
      }
    }); */
  }

  Future signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      return await Future.error(errorDefinition(e.toString()));
    }
  }

  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      final res = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if ((res.user?.identities ?? []).isEmpty) {
        return await Future.value("User already exists.");
      }
      if (res.user != null && res.session == null) {
        return await Future.value(
            "Please verify your email address.\nCheck your email.");
      }
      if (res.user != null && res.session != null) {
        // Go to dashboard page
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
