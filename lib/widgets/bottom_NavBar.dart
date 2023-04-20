// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:twitter_clone/tabs/home.dart';
import 'package:twitter_clone/tabs/add.dart';


List<Tweet> tweets = [];

class Tweet {
  final String username;
  final String handle;
  String tweetText;
  int likes;
  int retweets;
  DateTime timestamp;

  Tweet({
    required this.username,
    required this.handle,
    required this.tweetText,
    this.likes = 0,
    this.retweets = 0,
    required this.timestamp,
  });
}







  int selectedIndex = 0;

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() {
    return _BasicBottomNavBarState();
  }
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  static final List<Widget> _pages = <Widget>[
    const Home(),
    const Add(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(LucideIcons.twitter),
        title: const Text('Twitter'),
      ),
      body: Center(
        child: _pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.plusCircle),
            label: 'Add',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
