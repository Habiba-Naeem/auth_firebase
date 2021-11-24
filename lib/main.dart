import 'package:auth_firebase/presentation/profile/main_profile_screen.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';
import 'package:auth_firebase/presentation/theme/theme.dart';
import 'package:auth_firebase/presentation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:auth_firebase/presentation/router.dart';
import 'application/song/song_bloc.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/profile': (context) => ProfileScreen(),
      //   '/songs': (context) => SongsScreen(),
      // },
      
      onGenerateRoute: RouterGenerator.generateRoute,
      theme: theme,
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SongBloc(),
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
