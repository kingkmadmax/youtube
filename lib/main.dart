import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube/pages/profile.dart';
import 'package:youtube/screens/home_screen.dart';
import 'package:youtube/screens/nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter YouTube UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: Profile(),
    );
  }
}
