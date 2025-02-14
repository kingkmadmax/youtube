import 'package:flutter/material.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar UI
            TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                hintText: "Search for vidioes",
              ),
            ),
            const SizedBox(height: 20),
            // Wrapping ListView inside Expanded to avoid overflow
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/1.jpg',
                      width: 100,
                    ), // Add your image here
                    title: const Text("fluter how not to fail",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  const Divider(color: Colors.white, thickness: 1),
                  ListTile(
                    leading: Image.asset(
                      'assets/2.jpg',
                      width: 100,
                    ), // Add your image here
                    title: const Text("what to do if you fail flutter",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  const Divider(color: Colors.white, thickness: 1),
                  ListTile(
                    leading: Image.asset(
                      'assets/3.jpg',
                      width: 100,
                    ), // Add your image here
                    title: const Text("how to Download directly to your minde",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  const Divider(color: Colors.white, thickness: 1),
                  ListTile(
                    leading: Image.asset(
                      'assets/4.png',
                      width: 100,
                    ), // Add your image here
                    title: const Text(
                        "how to completely delete flatter from the world",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  const Divider(color: Colors.white, thickness: 1),
                  ListTile(
                    leading: Image.asset('assets/5.jpg',
                        width: 100), // Add your image here
                    title: const Text("how to jump my teacher",
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
