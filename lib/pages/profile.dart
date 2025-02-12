import 'package:flutter/material.dart';
import 'package:youtube/pages/newScreen.dart';

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
          child: Padding(
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
                              Text(
                                'Create a channel',
                                style: TextStyle(color: Colors.grey),
                              ),
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
                      _buildTag("Switch account"),
                      _buildTag("Google Account"),
                      _buildTag("Turn on Incognito"),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // History Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'History',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    _buildOutlinedButton("View all"),
                  ],
                ),
                const SizedBox(height: 15),

                // Horizontal Scrolling ListView
                _buildHorizontalListView(),

                const SizedBox(height: 25),

                // Playlists Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Playlists",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.add, color: Colors.white),
                        const SizedBox(width: 15),
                        _buildOutlinedButton("View all"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Second Horizontal ListView (Scrollable)
                _buildHorizontalListView(),

                const SizedBox(height: 20),

                // Expanded List
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ListTile(
                      leading: Icon(Icons.smart_display, color: Colors.white),
                      title: Text("Your videos",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.download, color: Colors.white),
                      title: Text("Downloads",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    Divider(color: Colors.white, thickness: 1),
                    ListTile(
                      leading: Icon(Icons.local_movies, color: Colors.white),
                      title: Text("Your Movies",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    Divider(color: Colors.white, thickness: 1),
                    ListTile(
                      leading: Icon(Icons.insert_chart, color: Colors.white),
                      title: Text("Time watched",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.help, color: Colors.white),
                      title: Text("Help & feedback",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function for small tags
  Widget _buildTag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Helper function for outlined buttons
  Widget _buildOutlinedButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white)),
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
}
