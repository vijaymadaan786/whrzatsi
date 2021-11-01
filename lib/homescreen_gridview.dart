import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/index",
      "assets/images/index1.jpg",
      "assets/images/index3.jpg",
      "assets/images/index4.jpg",
      "assets/images/index5.jpg",
      "assets/images/index6.jpg",
    ];
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(images.length, (index) {
          return Card(
            child: Image.asset(images[index]),
          ); //robohash.org api provide you different images for any number you are giving
        }),
      ),
    );
  }
}
