import 'package:flutter/material.dart';
import 'home_screen.dart';
class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen (),
    const Scaffold(body: Center(child: Text ( 'Explore'))),
    const Scaffold(body: Center(child: Text( 'Add'))),
    const Scaffold(body: Center(child: Text( 'Subscriptions'))),
    const Scaffold(body: Center(child: Text( 'Library'))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens.asMap().entries.map((entry) {
          int idx = entry.key;
          Widget screen = entry.value;
          return Offstage(
            offstage: _selectedIndex != idx,
            child: screen,
          );
        }).toList(),
      ),
  bottomNavigationBar: BottomNavigationBar(
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.white, // Active icon color
  unselectedItemColor: Colors.white, // Dark gray for inactive icons
  showSelectedLabels: true,
  showUnselectedLabels: true,
  selectedLabelStyle: TextStyle(fontSize: 12), // Adjusted for space
  unselectedLabelStyle: TextStyle(fontSize: 12), // Match selected label size
  backgroundColor: Colors.black,
  items: <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.play_circle_outline),
      activeIcon: Icon(Icons.play_circle_filled),
      label: 'Shorts',
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
        height: 24, // Ensures alignment with other icons
        child: Align(
          alignment: Alignment.center,
          child:  Container(
            width: 36, // Circular effect
            height: 36,
            decoration: BoxDecoration(
               color: Colors.grey[800], // Dark grey circle
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.white, size: 24), // Default icon size
          ),
        ),
      ),
      label: 'Add', // Keep space consistent
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.video_library_outlined),
      activeIcon: Icon(Icons.video_library),
      label: 'Subscriptions', // Ensure full text appears
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
),
    );
  }
}