import 'package:flutter/material.dart';

class Help_Feedback extends StatefulWidget {
  const Help_Feedback({super.key});

  @override
  State<Help_Feedback> createState() => _Help_FeedbackState();
}

class _Help_FeedbackState extends State<Help_Feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help & Feedback",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity, // Makes the container fill the screen width
        height: 550, // Makes the container fill the screen height
        padding: EdgeInsets.all(16),
        color: const Color.fromARGB(255, 58, 59, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Help Resources",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.assignment, color: Colors.white),
                    title: Text("Turn Restricted Mode on and or off on YouTube",
                        style: TextStyle(color: Colors.white)),
                    tileColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.assignment, color: Colors.white),
                    title: Text("View,delite or turn on or off wach history",
                        style: TextStyle(color: Colors.white)),
                    tileColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.assignment, color: Colors.white),
                    title: Text("Sing in & out of YouTube",
                        style: TextStyle(color: Colors.white)),
                    tileColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.assignment, color: Colors.white),
                    title: Text("View or delete your YouTube search history ",
                        style: TextStyle(color: Colors.white)),
                    tileColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.assignment, color: Colors.white),
                    title: Text("how to earn  money on Youtube -YouTube help",
                        style: TextStyle(color: Colors.white)),
                    tileColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Search help...",
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            const Divider(color: Colors.white, thickness: 1),
            ListTile(
              leading: Icon(Icons.message, color: Colors.white),
              title:
                  Text("Send Feedback", style: TextStyle(color: Colors.white)),
              tileColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            const Divider(color: Colors.white, thickness: 1),
          ],
        ),
      ),
    );
  }
}
