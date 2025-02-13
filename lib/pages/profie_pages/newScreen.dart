import 'package:flutter/material.dart';
import 'package:youtube/pages/profile.dart';

class Newscreen extends StatefulWidget {
  const Newscreen({super.key});

  @override
  State<Newscreen> createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
  void _navigateToHiScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50), // Moves content lower
            Row(
              children: [
                GestureDetector(
                  onTap: _navigateToHiScreen, // Add this to handle tap
                  child: Icon(Icons.arrow_back, size: 30),
                ),
                SizedBox(width: 40),
                Text(
                  "How you'll appear",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 20), // Added more space
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Picture",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Change your photo or take a new one",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Change your name or take a new one",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.edit, size: 18, color: Colors.white)
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Handle",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Change your handle or take a new one",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.edit, size: 18, color: Colors.white)
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 50),

            Center(
              child: Row(
                children: [
                  Icon(Icons.warning,
                      color: const Color.fromARGB(255, 221, 221, 221),
                      size: 20),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                      "terms and servase and how to \n amke a vidio and how to  make ")
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 400,
                padding:
                    EdgeInsets.symmetric(vertical: 12), // Adds some padding
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // Outline color
                    width: 2, // Border thickness
                  ),
                ),
                child: Center(
                  // Centers the text inside
                  child: Text(
                    "CREATE CHANNEL",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 248, 248, 248)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
