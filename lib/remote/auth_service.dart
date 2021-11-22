import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/domain/core/email/email.dart';
import 'package:auth_firebase/domain/core/password/password.dart';
import 'package:auth_firebase/remote/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

//creating databaseservice
// User? user = result.user;
//      user != null
//           ? await DatabaseService(uid: user.uid).updateUserData('0', 'new', 1)
//           : Error();

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signIn(Email email, Password password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      );
      print("signed in");
      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUp(Email email, Password password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    await auth.signOut();
  }

  dynamic getUser() {
    final User? user = auth.currentUser;
    final uid = user != null ? user.uid : null;
    return uid;
  }
}
