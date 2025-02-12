import 'package:flutter/material.dart';
import 'package:youtube/pages/profie_pages/newScreen.dart';
import 'package:youtube/pages/profie_pages/view_all.dart';
import 'package:youtube/pages/profie_pages/view_all2.dart';
import 'package:youtube/pages/profie_pages/switch_account.dart';
import 'package:youtube/pages/profie_pages/Help_&_feedback.dart';
import 'package:youtube/pages/profie_pages/Time_watched.dart';
import 'package:youtube/pages/profie_pages/your_Movies.dart';
import 'package:youtube/pages/profie_pages/Downloads.dart';
import 'package:youtube/pages/profie_pages/Your_videos.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Row
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newscreen()),
                      );
                    },
                    child: const CircleAvatar(radius: 35),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Geafra Dellalue",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: const [
                            Text('Create a channel',
                                style: TextStyle(color: Colors.grey)),
                            Icon(Icons.arrow_right, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Small Tags Row (Scrollable)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTag("Switch account", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SwitchAccount()),
                      );
                    }),
                    _buildTag("Google Account", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SwitchAccount()),
                      );
                    }),
                    _buildTag("Turn on Incognito"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // History Section
              _buildSectionHeader("History", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewAll()),
                );
              }),

              const SizedBox(height: 15),
              _buildHorizontalListView(),
              const SizedBox(height: 25),

              // Playlists Section
              _buildSectionHeader("Playlists", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewAll2()),
                );
              }),

              const SizedBox(height: 20),
              _buildHorizontalListView(),
              const SizedBox(height: 20),

              // Expanded List
              _buildOptionsList(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function for section headers with a View All button
  Widget _buildSectionHeader(String title, VoidCallback onViewAllPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Icon(Icons.add, color: Colors.white), // Add icon
            _buildOutlinedButton("View all", onViewAllPressed),
          ],
        ),
      ],
    );
  }

  // Helper function for small tags
  Widget _buildTag(String text, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 70, 70, 70).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Helper function for outlined buttons with navigation support
  Widget _buildOutlinedButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  // Helper function for horizontal scrolling list
  Widget _buildHorizontalListView() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildVideoItem("assets/1.jpg", "Introduction to Flutter"),
          _buildVideoItem("assets/2.jpg", "Advanced Flutter"),
          _buildVideoItem("assets/3.jpg", "Dart Basics"),
          _buildVideoItem("assets/4.png", "More Dart"),
          _buildVideoItem("assets/5.jpg", "Flutter Widgets"),
        ],
      ),
    );
  }

  // Helper function for video items in horizontal list
  Widget _buildVideoItem(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          SizedBox(
            width: 130,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // Helper function for the expanded list
  Widget _buildOptionsList() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          leading: const Icon(Icons.smart_display, color: Colors.white),
          title: const Text("Your videos",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YourVideos()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.download, color: Colors.white),
          title: const Text("Downloads",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Downloads()),
            );
          },
        ),
        const Divider(color: Colors.white, thickness: 1),
        ListTile(
          leading: const Icon(Icons.local_movies, color: Colors.white),
          title: const Text("Your Movies",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YourMoviess()),
            );
          },
        ),
        const Divider(color: Colors.white, thickness: 1),
        ListTile(
          leading: const Icon(Icons.insert_chart, color: Colors.white),
          title: const Text("Time watched",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimeWatched()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.help, color: Colors.white),
          title: const Text("Help & feedback",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Help_Feedback()),
            );
          },
        ),
      ],
    );
  }
}
