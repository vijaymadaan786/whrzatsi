import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whrzats/tabBar_Activity.dart';
import 'package:whrzats/tabBar_Favourites.dart';
import 'package:whrzats/tabBar_notifications.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/images/ic_edit.png'),
                            size: 32,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Center(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),)),
                          ImageIcon(
                            AssetImage('assets/images/ic_settings.png'),
                            size: 32,
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 17),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/index3.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("RapGuru",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/ic_like_profile.png"),
                        Text(
                          "  7M Likes",
                          style: TextStyle(fontFamily: 'OpenSans'),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: SizedBox(
                                height: 300,
                                child: DefaultTabController(
                                    length: 3,
                                    child: Scaffold(
                                      appBar: TabBar(
                                        indicatorColor: Colors.black,
                                        tabs: [
                                          Tab(
                                            child: Text("Activity",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                          Tab(
                                            child: Text("Favourites",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                          Tab(
                                            child: Text("Notifications",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          )
                                        ],
                                      ),
                                      body: TabBarView(
                                        children: [
                                          TabBar_Activity(),
                                          TabBar_Favourites(),
                                          TabBar_Notifications()
                                        ],
                                      ),
                                    ) // Complete this code in the next step.
                                    )))
                      ]))
                ]))));
  }
}
