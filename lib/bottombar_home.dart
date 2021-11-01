import 'package:flutter/material.dart';
import 'package:whrzats/tab_events.dart';
import 'package:whrzats/tab_friends.dart';
import 'package:whrzats/tab_happenings.dart';
import 'package:whrzats/tab_trending.dart';

class Homebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Row(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 24),
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, top: 12),
                alignment: Alignment.topLeft,
                child: Column(children: <Widget>[
                  Image.asset("assets/images/icmap.png"),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.location_on),
                  // ),
                  Text("Map")
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 90, top: 8),
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Image.asset("assets/images/logocircle.png"),
                  Text(
                    "WhrzAt",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 70, top: 0),
                alignment: Alignment.topRight,
                child: Column(children: <Widget>[
                  // Image.asset("assets/images/logocircle.png"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 10),
                  )
                ]),
              ),
            ]))
      ])
    ]));
  }
}

//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             title: Text("Whrzat",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepOrange)),
//             centerTitle: true,
//             bottom: TabBar(
//                 tabs: [
//                   Tab(text: "Trending"),
//                   Tab(text: "Happening"),
//                   Tab(text: "Friends"),
//                   Tab(text: "Events")
//                 ],
//                 indicatorColor: Colors.black,
//                 unselectedLabelColor: Colors.grey,
//                 labelColor: Colors.black,
//                 labelStyle:
//                     TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
//           ),
//           body: TabBarView(
//             children: [Trending(), Friends(), Events(), Happenings()],
//           ),
//         ),
//       ),
//     );
//   }
// }

// tabs:
// [
//   Tab(text: "Trending"),
//   Tab(text: "Happening"),
//   Tab(text: "Friends"),
//   Tab(text: "Events")
// ];
//     return Scaffold(
//         body: TabBarView(children: [
//       Trending(),
//       Happenings(),
//       Friends(),
//       Events(),
//     ]));
//   }
// }
