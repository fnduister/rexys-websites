import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LogedIn {
  bool authSignedIn = false;
  String? uid = "";
  String? userEmail = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmailPassword(String email, String password) async {
    // Initialize Firebase
    await Firebase.initializeApp();

    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;

    if (user != null) {
      // checking if uid or email is null

      assert(user.email != null);

      uid = user.uid;
      userEmail = user.email;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);
      authSignedIn = true;
      return 'Successfully logged in, User UID: ${user.uid}';
    }

    return null;
  }

  Future<String> signOut() async {
    await _auth.signOut();

    uid = null;
    userEmail = null;
    authSignedIn = false;
    return 'User signed out';
  }
}
