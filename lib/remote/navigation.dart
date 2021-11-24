import 'package:auth_firebase/presentation/profile/main_profile_screen.dart';
import 'package:auth_firebase/presentation/router.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';

class Navigation {
  final String nav;

  const Navigation({required this.nav});

  
}

const List<Navigation> navigation = const <Navigation>[
  Navigation(nav: SongsScreen.id),
  Navigation(nav: ProfileScreen.id),
];
