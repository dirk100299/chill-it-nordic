import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAH9mOn8Q3c-D-qSXA5llG1I3bEywILFIY",
            authDomain: "dirkapp-fea17.firebaseapp.com",
            projectId: "dirkapp-fea17",
            storageBucket: "dirkapp-fea17.appspot.com",
            messagingSenderId: "169689583790",
            appId: "1:169689583790:web:744a56fc918871bc4f1d3f"));
  } else {
    await Firebase.initializeApp();
  }
}
