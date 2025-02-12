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
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newscreen()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 35,
                    )),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const Text(
                      "Geafra Dellalue",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'create a channel',
                          style: TextStyle(
                              color: Color.fromARGB(255, 169, 169, 169)),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_right_sharp,
                          color: Color.fromARGB(255, 169, 169, 169),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // the small tags
            Row(
              children: [
                Container(
                  width: 130,
                  height: 25,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 135, 130, 130),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Switch account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 130,
                  height: 25,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 135, 130, 130),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "google Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 130,
                  height: 25,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 135, 130, 130),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Turn on Incognito",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            // the History section, adjusted to move right
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20), // Padding added to move it to the right
                      child: Text(
                        'History',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width:
                          250, // Adjusted this width to push the 'View all' button to the right
                    ),
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 1.0, // Border width
                          style: BorderStyle.solid, // Border style
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "View all",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Updated ListView
                SizedBox(
                  height: 150, // Set a fixed height to avoid vertical overflow
                  child: ListView(
                    scrollDirection:
                        Axis.horizontal, // Enable horizontal scrolling
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 100,
                            child: Image.asset('assets/1.jpg'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Introduction to Flutter",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Container(
                            width: 100,
                            child: Image.asset('assets/2.jpg'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Advanced Flutter",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Container(
                            width: 130,
                            child: Image.asset('assets/3.jpg'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Dart Basics",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("playlists"),
                    SizedBox(width: 230),
                    Icon(Icons.add),
                    SizedBox(width: 30),
                    Container(
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 1.0, // Border width
                            style: BorderStyle.solid, // Border style
                          ),
                        ),
                        child: Center(child: Text("view all")))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150, // Set a fixed height to avoid vertical overflow
              child: ListView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        child: Image.asset('assets/1.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Introduction to Flutter",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        child: Image.asset('assets/2.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Advanced Flutter",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: 130,
                        child: Image.asset('assets/3.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Dart Basics",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: 130,
                        child: Image.asset('assets/4.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Dart Basics",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: 130,
                        child: Image.asset('assets/5.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Dart Basics",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
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
                  SizedBox(
                    height: 25,
                  ),
                  Divider(color: Colors.white, thickness: 1),
                  ListTile(
                    leading: Icon(Icons.local_movies, color: Colors.white),
                    title: Text("Your Movies",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  Divider(color: Colors.white, thickness: 1),
                  SizedBox(
                    height: 25,
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
