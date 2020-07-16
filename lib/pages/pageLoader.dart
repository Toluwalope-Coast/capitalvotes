import 'package:capitalvotes/pages/add_contest.dart';
import 'package:capitalvotes/pages/home.dart';
import 'package:capitalvotes/pages/profile.dart';
import 'package:capitalvotes/pages/third_person_profile_screen.dart';
import 'package:capitalvotes/pages/withdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'earnings_screen.dart';
import 'search.dart';

class PageLoader extends StatefulWidget {
  @override
  _PageLoader createState() => _PageLoader();
}

class _PageLoader extends State<PageLoader> {
  int feedCounts = 0;
  int _selectedIndex = 0;
  final _pageOptions = [EarningsScreen(), Search(), AddContest(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
          child: _pageOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 45.0,
          width: screenWidth,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0.0),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0.0),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0.0),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0.0),
                ),
              )
            ],
            selectedItemColor: Color(0xffE5306C),
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            elevation: 16.0,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
          ),
        ));
  }
}
