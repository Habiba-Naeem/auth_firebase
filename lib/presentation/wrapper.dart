import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:auth_firebase/presentation/auth/auth.dart';
import 'package:auth_firebase/presentation/profile/profile_screen.dart';
import 'package:auth_firebase/presentation/profile/songs.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('profiles')
                  .doc(AuthService().getUser().uid)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  return BlocProvider(
                      create: (_) => SongBloc(), child: SongsScreen());
                }
                return ProfileScreen();
              });
        }

        return const Authenticate();
      },
    );
  }
}
/*
return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('profiles')
                .doc(AuthService().getUser().uid)
                .snapshots(),
            // stream:
            //     ProfileService(uid: AuthService().getUser().uid).getProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BlocProvider(
                    create: (_) => SongBloc(), child: SongsScreen());
              }
              return ProfileScreen();
            },*/
