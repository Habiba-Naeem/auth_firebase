import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:auth_firebase/presentation/auth/auth.dart';
import 'package:auth_firebase/presentation/profile/songs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlocProvider(
            create: (_) => SongBloc(),
            child: SongsScreen(),
          );
        }
        return const Authenticate();
      },
    );
  }
}
