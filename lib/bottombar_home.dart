import 'package:flutter/material.dart';
import 'bottomhomebar_griddetails.dart';
import 'model/photo.dart';
import 'network/network_request.dart';

class Homebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 23),
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
                    Text(
                      "Map",
                      style: TextStyle(fontFamily: 'OpenSans'),
                    )
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
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(left: 70, top: 6, bottom: 2),
                  alignment: Alignment.topRight,
                  child: Column(children: <Widget>[
                    Image.asset("assets/images/icsearch.png"),
                    // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                    )
                  ]),
                ),
              ])),
          // Expanded(
          //   child: GridView.extent(
          //     primary: false,
          //     padding: const EdgeInsets.all(16),
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 10,
          //     maxCrossAxisExtent: 200,
          //     children: <Widget>[
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "First",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.black),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Second",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.grey),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Third",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.blue),
          //       Container(
          //         padding: const EdgeInsets.all(8),
          //         child: const Text(
          //           "Forth",
          //           style: TextStyle(
          //             fontSize: 20,
          //           ),
          //         ),
          //         color: Colors.yellowAccent,
          //       ),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Fifth",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.green),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Sixth",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.black),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Seventh",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.grey),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Eighth",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.deepOrange),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Ninth",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.purpleAccent),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "Ten",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.teal),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "XI",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.deepPurpleAccent),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "XII",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.orangeAccent),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "XIII",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.lightBlueAccent),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "XIV",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.blueGrey),
          //       Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text(
          //             "XV",
          //             style: TextStyle(
          //               fontSize: 20,
          //             ),
          //           ),
          //           color: Colors.brown),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class HomeBar extends StatefulWidget {
  @override
  _HomeBarState createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.map((photo) {
          return GestureDetector(
              child: GridTile(),
              onTap: () {
                gotoDetailPage(context, photo);
              });
        }).toList(),
      ),
    );
  }

  gotoDetailPage(BuildContext context, Photo photo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GridDetails(photo: photo)));
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid View Flutter"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: FutureBuilder<List<Photo>>(
                      future: NetworkRequest.fetchPhotos(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(('Error ${snapshot.hasData}'));
                        } else if (snapshot.hasData) {
                          return gridView(snapshot);
                        }
                        return CircularProgressIndicator();
                      }))
            ]));
  }
}

//   Column(
//     children: <Widget>[
//       GridView.extent(
//         primary: false,
//         padding: const EdgeInsets.all(16),
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         maxCrossAxisExtent: 200,
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "First",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.black),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Second",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Third",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.blue),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Text(
//               "Forth",
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             color: Colors.yellowAccent,
//           ),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Fifth",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.green),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Sixth",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.black),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Seventh",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Eighth",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Ninth",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "Ten",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "XI",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "XII",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "XIII",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "XIV",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//           Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                 "First",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               color: Colors.grey),
//         ],
//       ),
//     ],
//   )
// ]));

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
