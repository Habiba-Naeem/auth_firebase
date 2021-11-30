import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/presentation/auth/auth.dart';
import 'package:auth_firebase/presentation/profile/profile_form_screen.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/users_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FutureProvider<UserModel>.value(
            initialData:
                UserModel(age: 0, bio: '', uid: '', username: '', docId: ''),
            // UserService(uid: AuthService().getUser().uid).getUser(),
            value: UserService(uid: AuthService().getUser().uid).getUser(),
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(AuthService().getUser().uid)

                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    return BlocProvider(
                        create: (_) => SongBloc(), child: const SongsScreen());
                  }
                  return const ProfileFormScreen();
                }),
          );
        }

        return const Authenticate();
      },
    );
  }
}
