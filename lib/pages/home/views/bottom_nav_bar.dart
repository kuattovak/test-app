import 'package:firebase_authorization/pages/profile/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import '../../bookmarks/views/bookmarks.dart';
import 'home_page.dart';

class MyBottomNavigationBarApp extends StatefulWidget {
  @override
  _MyBottomNavigationBarAppState createState() =>
      _MyBottomNavigationBarAppState();
}

class _MyBottomNavigationBarAppState extends State<MyBottomNavigationBarApp> {
  int _selectedIndex = 0;

  // List of screens/pages to be displayed for each navigation option
  final List<Widget> _pages = [HomePage(), BookMarks(), Dashboard()];

  // Handle the navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.bookmark),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
