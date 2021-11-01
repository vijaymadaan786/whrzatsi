import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          Text(
            "Chats",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  labelText: "Search by name...",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  // border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  // enabledBorder: const OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //   borderSide: const BorderSide(
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  //   borderSide: BorderSide(color: Colors.black),
                  // )
                ),
              )),

          //             ListView.builder(
          //             // Let the ListView know how many items it needs to build.
          //             itemCount: persons.length,
          // // Provide a builder function. This is where the magic happens.
          // // Convert each item into a widget based on the type of item it is.
          // itemBuilder: (context, index) {
          // final item = persons[index];
          // },
          // )
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                // To create a listview
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/index.jpg",
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Vijay",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                            Text("Hi How are you"),
                            // Badge(
                            //     position:
                            //         BadgePosition.topEnd(top: 10, end: 10),
                            //     badgeContent: Text(
                            //       '9',
                            //       style: TextStyle(
                            //           color: Colors.white, fontSize: 10),
                            //     ),
                            //     child: IconButton(
                            //         icon: Icon(Icons.shopping_cart),
                            //         onPressed: () {}))
                          ],
                        )
                      ],
                    )),
                  );
                  // ListTile(
                  //   // I only return List tile which includes leading, Trailing and title.
                  //   leading: Icon(Icons.list), // Beginning
                  //   trailing: Text(
                  //     "GFG", //Ending
                  //     style: TextStyle(color: Colors.green, fontSize: 15),
                  //   ),
                  //   title: Text("List item $index"));
                }),
          ),
        ],
      ),
    );
  }
}
