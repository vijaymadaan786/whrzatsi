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
   PageController _pageController= PageController();
  static List<Widget> tabPages = [
    Homebar(),
    Add(),
    Chat(),
    Profile()
  ];
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
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 300),curve: Curves.easeInOut);
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
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            label: 'Add',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.black),
            label: 'Chat',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        onTap: onTabTapped,
      ),
    );
  }
}
//     return Scaffold(
//         body: Column(children: <Widget>[
//       Row(children: <Widget>[
//         Container(
//           margin: EdgeInsets.only(top: 24),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(left: 20, top: 0),
//                 alignment: Alignment.topLeft,
//                 child: Column(children: <Widget>[
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.location_on),
//                   ),
//                   Text("Map")
//                 ]),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 90, top: 8),
//                 alignment: Alignment.center,
//                 child: Row(children: <Widget>[
//                   Image.asset("assets/images/logocircle.png"),
//                   Text(
//                     "WhrzAt",
//                     style: TextStyle(
//                         color: Colors.deepOrange,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),
//                   )
//                 ]),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 70, top: 0),
//                 alignment: Alignment.topRight,
//                 child: Column(children: <Widget>[
//                   // Image.asset("assets/images/logocircle.png"),
//                   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//                   Text(
//                     "Search",
//                     style: TextStyle(fontSize: 10),
//                   )
//                 ]),
//               ),
//               DefaultTabController(
//                 length: 4,
//                 child: Scaffold(
//                     appBar: AppBar(
//                       title: Text('Flutter Tabs Demo'),
//                       bottom: TabBar(
//                         tabs: [
//                           Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
//                           Tab(icon: Icon(Icons.camera_alt), text: "Tab 2"),
//                           Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
//                           Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
//                         ],
//                       ),
//                     ),
//                     body: TabBarView(children: [
//                       Trending(),
//                       Happenings(),
//                       Friends(),
//                       Events(),
//                     ])),
//               ),
//             ],
//           ),
//         ),
//       ])
//     ]));
//   }
// }
