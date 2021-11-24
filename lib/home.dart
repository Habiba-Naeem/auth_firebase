import 'package:auth_firebase/presentation/profile/main_profile_screen.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';
import 'package:auth_firebase/presentation/theme/theme.dart';
import 'package:auth_firebase/presentation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Wrapper();
            }
            return const Center(
              child: Text("Hello"),
            );
          },
        );
  }
}

//  home: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => SongBloc(),
//           )
//         ],
//         child: FutureBuilder(
//           future: Firebase.initializeApp(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Wrapper();
//             }
//             return const Center(
//               child: Text("Hello"),
//             );
//           },
//         ),
//       ),