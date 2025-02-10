import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 100.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset('assets/yt_logo_dark.png'),
          ),
          actions: [
              IconButton(
                icon: Icon(Icons.cast),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notification_add_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
        ),
      ],
    ));
  }
}
