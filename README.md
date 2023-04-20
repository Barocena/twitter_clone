# twitter_clone

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

import 'package:lucide_icons/lucide_icons.dart';

bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.plusCircle),
            label: 'Add Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.mail),
            label: 'Direct Messages',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 29, 161, 242),
      ),