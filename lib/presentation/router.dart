import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/presentation/profile/main_profile_screen.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/users_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'discover/discover_profiles_screen.dart';
import 'followers/followers.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case songs:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(providers: [
            BlocProvider(create: (_) => SongBloc()),
            FutureProvider<UserModel>(
              create: (_) => UserService(uid: AuthService().getUser().uid)
                  .getUser(),
              initialData: UserModel(age: 0, bio: '', uid: '', username: '', docId: ''),
            ),
          ], child: const SongsScreen()),
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => FutureProvider<UserModel>(
            create: (_) =>
                UserService(uid: AuthService().getUser().uid).getUser(),
            initialData: UserModel(age: 0, bio: '', uid: '', username: '', docId: ''),
            child: const ProfileScreen(),
          ),
        );
      case discover:
        return MaterialPageRoute(
            builder: (_) => const DiscoverProfilesScreen());
      case friend:
        return MaterialPageRoute(builder: (_) => const FriendScreen());
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
const String discover = DiscoverProfilesScreen.id;
const String friend = FriendScreen.id;
