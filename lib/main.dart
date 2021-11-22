import 'package:auth_firebase/presentation/profile/songs.dart';
import 'package:auth_firebase/presentation/theme/theme.dart';
import 'package:auth_firebase/presentation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'application/song/song_bloc.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/profile': (context) => SongsScreen(),
      },
      theme: theme,
      home: 
      MultiBlocProvider(
         providers: [
          BlocProvider(
            create: (context) =>SongBloc(),
          )
        ],
        child: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Wrapper();
              }
              return const Center(
                child: Text("Hello"),
              );
            },
          ),
      ),
      
    );
  }
}
