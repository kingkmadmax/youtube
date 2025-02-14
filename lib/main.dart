import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube/screens/profie/profile.dart';
import 'package:youtube/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube/screens/nav_screen.dart';
import 'package:youtube/screens/profie/Help_&_feedback.dart';
import 'package:youtube/screens/shorts_screen.dart';

void main() {
runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: ' YouTube ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: NavScreen(),
    );
  }
}
