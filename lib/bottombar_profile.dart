import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    ));
  }
}
