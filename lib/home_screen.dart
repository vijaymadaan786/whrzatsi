import 'package:flutter/material.dart';
import 'package:whrzats/bottombar_add.dart';
import 'package:whrzats/bottombar_chat.dart';
import 'package:whrzats/bottombar_home.dart';
import 'package:whrzats/bottombar_profile.dart';
import 'package:whrzats/tab_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeScreenState extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenState> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  static List<Widget> tabPages = [Homebar(), AddState(), Chat(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController = PageController(initialPage: _selectedIndex);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._selectedIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body: Center(
        child: tabPages.elementAt(_selectedIndex),
      ),*/
      body: PageView(
        children: tabPages,
        onPageChanged: _onItemTapped,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/ic_home_active.png"),
                size: 28,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/ic_add_active.png"),
              size: 28,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/ic_chat_active.png"),
                size: 28,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/ic_profile_active.png"),
                size: 28,
              ),
              label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: onTabTapped,
      ),
    );
  }
}
