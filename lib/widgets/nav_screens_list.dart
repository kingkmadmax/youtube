import 'package:flutter/material.dart';
import 'package:youtube/pages/profile.dart';
import 'package:youtube/screens/home_screen.dart';
import 'package:youtube/screens/shorts_page.dart';
import 'package:youtube/screens/subscriptions_screen.dart';
final List<Widget> navScreensList = [
  HomeScreen(),
  ShortsPage(),
  const Scaffold(body: Center(child: Text('Add'))),
  SubscriptionsScreen(),
  Profile(),
];
