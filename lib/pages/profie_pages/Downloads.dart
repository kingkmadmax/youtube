import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Downloads",
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
          SizedBox(height: 30), // Adds space between row and text section
          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Align text in the center
              children: [
                Text(
                  "Videos you download will appear here",
                  style: TextStyle(
                      fontSize: 18, color: Colors.grey), // Adjust the font size
                  textAlign: TextAlign.center, // Center the text
                ),
                SizedBox(height: 20), // Add space between text and button
              ],
            ),
          ),
          Expanded(
            // Use Expanded to push the "Recommended downloads" to the bottom
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ), // Adjust padding
                child: Text(
                  "Recommended downloads",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
