import 'package:flutter/material.dart';
import 'package:youtube/widgets/cutom_sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer for sliding from the left
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Updated DrawerHeader with the same size as the app bar logo
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  'assets/yt_logo_dark.png',
                  width: 10, // Same width as in the SliverAppBar
                  height: 5, // Adjusted height to match the app bar logo height
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(),
              // Row of buttons, with the Explorer button as the first item
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  height: 25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // New Explorer button as the first item
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Open the Drawer when the new button is pressed
                            Scaffold.of(context).openDrawer();
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 46, 46, 46),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.explore,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // The rest of the genre buttons
                      for (int i = 0; i < genreList.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = i + 1; // Adjust index to avoid conflict
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                              decoration: BoxDecoration(
                                color: selectedIndex == i + 1 ? Colors.white : const Color.fromARGB(255, 46, 46, 46),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  genreList[i],
                                  style: TextStyle(
                                    color: selectedIndex == i + 1 ? Colors.black : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // List of genre texts
  List<String> genreList = [
    "All", "New to You", "Podcast", "Couple", "Music", "Trending", "Gaming", "Live", "Comedy"
  ];
}
