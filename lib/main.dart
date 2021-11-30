import 'package:auth_firebase/presentation/theme/theme.dart';
import 'package:auth_firebase/presentation/wrapper.dart';
import 'package:auth_firebase/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth_firebase/presentation/router.dart';


final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     onGenerateRoute: RouterGenerator.generateRoute,
      theme: theme,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Wrapper();
          }
          return const Loading();
        },
      ),
    );
  }
}
