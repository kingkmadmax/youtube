import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Widget buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14, // Set the font size here
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Fixed Drawer Header with YouTube logo
          Container(
            padding: EdgeInsets.only(top: 60), // Adjust top padding for logo
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  'assets/yt_logo_dark.png',
                  width: 90, // Adjusted width for smaller logo
                ),
              ),
            ),
          ),

          SizedBox(height: 25),
          // Scrollable content area for drawer items (closer to logo)
          // Drawer items list (scrollable)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildDrawerItem(Icons.local_fire_department, 'Trending', () {}),
                  buildDrawerItem(Icons.shopping_bag, 'Shopping', () {}),
                  buildDrawerItem(Icons.music_note, 'Music', () {}),
                  buildDrawerItem(Icons.movie, 'Movies & TV', () {}),
                  buildDrawerItem(Icons.live_tv, 'Live', () {}),
                  buildDrawerItem(Icons.videogame_asset, 'Gaming', () {}),
                  buildDrawerItem(Icons.article, 'News', () {}),
                  buildDrawerItem(Icons.sports_soccer, 'Sports', () {}),
                  buildDrawerItem(Icons.school, 'Courses', () {}),
                  buildDrawerItem(Icons.brush, 'Fashion & Beauty', () {}),
                  buildDrawerItem(Icons.podcasts, 'Podcasts', () {}),
                  buildDrawerItem(Icons.gamepad, 'Playables', () {}),
                ],
              ),
            ),
          ),

          // Bottom bar with Privacy Policies & Terms of Service
          Container(
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[700]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Privacy Policies", style: TextStyle(color: const Color.fromARGB(255, 99, 99, 99))),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Terms of Service", style: TextStyle(color: const Color.fromARGB(255, 99, 99, 99))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

