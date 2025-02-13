import 'package:flutter/material.dart';

class YourMoviess extends StatefulWidget {
  const YourMoviess({super.key});

  @override
  State<YourMoviess> createState() => _YourMoviessState();
}

class _YourMoviessState extends State<YourMoviess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
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
          Spacer(), // Pushes content lower
          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Align text in the center
              children: [
                Icon(
                  Icons.local_offer,
                  size: 130,
                  color: const Color.fromARGB(255, 228, 228, 228),
                ),
                SizedBox(height: 20), // Adds space between icon and text
                Text(
                  "You don't have any purchases",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Adjust the font size
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
                SizedBox(height: 10), // Add space between text
                Text(
                  "Movies and shows you rent or buy will\nappear here",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Adjust the font size
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ],
            ),
          ),
          Spacer(flex: 2), // Adds more space at the bottom
        ],
      ),
    );
  }
}
