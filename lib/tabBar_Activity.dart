import 'package:flutter/material.dart';

class TabBar_Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Image.asset('assets/images/ic_new_activity.png'),
        Text("No New Activity")
      ],
    ));
  }
}
