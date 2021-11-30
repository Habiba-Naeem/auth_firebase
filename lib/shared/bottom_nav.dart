import 'package:auth_firebase/remote/navigation.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
<<<<<<< HEAD
=======
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).popAndPushNamed(navigation[index].nav);
    });
  }

>>>>>>> 7eb1fa11c4d7763437c7707a7f266dc9d346a497
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Songs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue[800],
      onTap: _onItemTapped,
    );
  }
}
