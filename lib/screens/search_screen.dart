import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable default back button
        backgroundColor: Colors.transparent, // Black background for the AppBar
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0), // Left padding to position the search bar correctly
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Navigate back when pressed
                },
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Search', // Placeholder text
                    fillColor: Colors.grey[800], // Dark grey background
                    filled: true, // Enable background fill
                    border: InputBorder.none, // Remove the outline
                    hintStyle: TextStyle(color: Colors.white), // White hint text
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Decreased height
                    isDense: true, // Reduce height further
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Apply corner radius
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Apply corner radius
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // White text input
                  onChanged: (text) {
                    // Optionally reset something when text changes
                  },
                  onSubmitted: (text) {
                    // Handle search when 'Enter' is pressed
                    print('Searching for: $text');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0), // Add left padding to the mic icon
                child: Container(
                  height: 40.0, // Set the height to match the search bar
                  width: 40.0, // Set the width to match the search bar
                  decoration: BoxDecoration(
                    color: Colors.grey[800], // Dark grey circle background
                    shape: BoxShape.circle, // Circular shape
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white), // Mic icon inside the circle
                    onPressed: () {
                      // Handle mic button press (you can implement functionality here)
                      print('Mic button pressed');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SizedBox.shrink(), // Empty body as the list of suggestions has been removed
    );
  }
}
