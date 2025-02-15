
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/screens/Home_page.dart';
import 'package:flutter_application_1/screens/vedio_page.dart';








class BottomNavigationBarpage extends StatefulWidget {
  const BottomNavigationBarpage({super.key});

  @override
  State<BottomNavigationBarpage> createState() => _HomepageState();
}

class _HomepageState extends State<BottomNavigationBarpage> {
  int _pageIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    HomePage(),
    VedioPage()
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.white,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        height: 70,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.video_file_outlined, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
