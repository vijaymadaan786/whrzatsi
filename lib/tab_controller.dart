import 'package:flutter/material.dart';
import 'package:whrzats/tab_events.dart';
import 'package:whrzats/tab_friends.dart';
import 'package:whrzats/tab_happenings.dart';
import 'package:whrzats/tab_trending.dart';

class TabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                TabBar(
                  tabs: [
                    Tab(text: "Trending"),
                    Tab(text: "Happening"),
                    Tab(text: "Friends"),
                    Tab(text: "Events")
                  ],
                ),
              ]),
            ),
            body: TabBarView(children: [
              Trending(),
              Happenings(),
              Friends(),
              Events(),
            ])));
  }
}
