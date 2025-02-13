import 'package:flutter/material.dart';

class YourVideos extends StatefulWidget {
  const YourVideos({super.key});

  @override
  State<YourVideos> createState() => _YourVideosState();
}

class _YourVideosState extends State<YourVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your videos",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [],
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add some space at the top
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Space out the items
            children: [
              Container(
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Icon(Icons.edit,
                    color: const Color.fromARGB(255, 255, 255, 255), size: 20),
              ),
              Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Center(child: Text("Videos"))),
              Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Center(child: Text("Shorts"))),
              Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Center(child: Text("Lives"))),
            ],
          ),
          SizedBox(height: 30), // Adds space between row and text section
          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Align text in the center
              children: [
                Text(
                  "Share your videos with anyone, or everyone",
                  style: TextStyle(fontSize: 18), // Adjust the font size
                  textAlign: TextAlign.center, // Center the text
                ),
                SizedBox(height: 20), // Add space between text and button
                Container(
                  width: 150, // Increased width for better visibility
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Create",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
