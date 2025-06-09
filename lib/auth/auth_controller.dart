import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.userChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async => await _firebaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async => await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    _firebaseAuth.signInWithCredential(authCredential);
  }

  Future<void> signOut() async => await _firebaseAuth.signOut();
}
