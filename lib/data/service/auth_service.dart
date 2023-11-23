import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<String?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          return 'Email address is already associated with another account.';
        } else if (e.code == 'weak-password') {
          return 'Password is too weak. Please use a stronger password.';
        } else if (e.code == 'invalid-email') {
          return 'Invalid email address.';
        }
      }
      return e.toString();
    }
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          return 'Email atau kata sandi tidak valid.';
        } else if (e.code == 'invalid-email') {
          return 'Alamat email tidak valid.';
        }
      }
      return e.toString();
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        return 'Login with Google canceled.';
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      //  login ke Firebase dengan credential Google
      await _auth.signInWithCredential(credential);

      return null; // Berhasil login
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print('Error during sign out: $e');
      throw e;
    }
  }

  Future<void> verifyCode(String verificationId, String code) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      // Lakukan verifikasi kode
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Verifikasi kode berhasil, notifikasi listeners
      _notifyListeners(userCredential.user);
    } catch (e) {
      // Verifikasi kode gagal, tangani kesalahan
      print('Verification Failed: $e');
      throw e;
    }
  }

// Tambahkan fungsi _notifyListeners untuk memberitahu listeners ketika otentikasi berhasil
  void _notifyListeners(User? user) {
    if (user != null) {
      // Otentikasi berhasil, notifikasi listeners
      _auth.userChanges().listen((User? user) {
        // Implementasi tindakan yang sesuai jika otentikasi berhasil
        print('Notifying auth state listeners about user ( ${user?.uid} ).');
      });
    }
  }

}
