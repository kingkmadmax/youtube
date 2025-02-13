import 'package:flutter/material.dart';
import 'package:youtube/pages/profile.dart';
import 'package:youtube/screens/home_screen.dart';
//import 'package:flutter_youtube_ui/screens/subscriptions_screen.dart';
final List<Widget> navScreensList = [
  HomeScreen(),
  const Scaffold(body: Center(child: Text('Shorts'))),
  const Scaffold(body: Center(child: Text('Add'))),
  const Scaffold(body: Center(child: Text('Add'))),
  Profile(),
];
