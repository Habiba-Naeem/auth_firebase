import 'package:auth_firebase/remote/navigation.dart';
import 'package:flutter/material.dart';

// class BottomNavigation extends StatelessWidget {
//   BottomNavigation({@required this.currentTab, @required this.onSelectTab});
//   final TabItem currentTab;
//   final ValueChanged<TabItem> onSelectTab;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: [
//         _buildItem(TabItem.red),
//         _buildItem(TabItem.green),
//         _buildItem(TabItem.blue),
//       ],
//       onTap: (index) => onSelectTab(
//         TabItem.values[index],
//       ),
//     );
//   }

//   BottomNavigationBarItem _buildItem(TabItem tabItem) {
//     return BottomNavigationBarItem(
//       icon: Icon(
//         Icons.layers,
//         color: _colorTabMatching(tabItem),
//       ),
//       label: tabName[tabItem],
//     );
//   }

//   Color _colorTabMatching(TabItem item) {
//     return currentTab == item ? activeTabColor[item] : Colors.grey;
//   }
// }
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  // static const List<Navigator> routes = [
  //   Navigator.push(context, '/songs'),

  // ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pushNamed(navigation[index].nav) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Songs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
