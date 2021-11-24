import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:auth_firebase/presentation/profile/main_profile_screen.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case songs:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => SongBloc(),
                child: const SongsScreen())); //SongsScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

//Dynamic Routes for generating navigation
const String songs = SongsScreen.id;
const String profile = ProfileScreen.id;
