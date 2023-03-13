import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DirkAppFirebaseUser {
  DirkAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DirkAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DirkAppFirebaseUser> dirkAppFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DirkAppFirebaseUser>(
      (user) {
        currentUser = DirkAppFirebaseUser(user);
        return currentUser!;
      },
    );
