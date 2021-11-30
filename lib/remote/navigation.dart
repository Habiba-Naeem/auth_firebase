import 'package:auth_firebase/presentation/discover/discover_profiles_screen.dart';
import 'package:auth_firebase/presentation/profile/main_profile_screen.dart';
import 'package:auth_firebase/presentation/songs/songs.dart';

class Navigation {
  final String nav;
  const Navigation({required this.nav});
}

const List<Navigation> navigation = <Navigation>[
  Navigation(nav: SongsScreen.id),
  Navigation(nav: DiscoverProfilesScreen.id),
  Navigation(nav: ProfileScreen.id),
];
