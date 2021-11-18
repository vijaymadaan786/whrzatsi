import 'package:flutter/material.dart';
class TabBar_Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/ic_new_activity.png'),
            Text("No New Activity")
          ],
        ));
  }
}