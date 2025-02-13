import 'package:flutter/material.dart';

class ViewAll2 extends StatefulWidget {
  const ViewAll2({super.key});

  @override
  State<ViewAll2> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlists"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/1.jpg',
                      width: 100,
                    ), // Add your image here
                    title: const Text("whache later",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/2.jpg',
                      width: 100,
                    ), // Add your image here
                    title: const Text("Liked videos",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              ),
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
                        color: const Color.fromARGB(255, 255, 255, 255)),
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
