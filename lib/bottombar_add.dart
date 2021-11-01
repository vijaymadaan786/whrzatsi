import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(backgroundColor: Colors.white, title: Text("Add Hotspot", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black),),),
        body: Column(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 23),
          child: Row(children: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Text(
                "Add Hotspot",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
          ])),
      Container(
        color: Colors.black12,
        child: Image.asset("assets/images/ic_add_image.png",
            width: 290, height: 200, fit: BoxFit.fill),
      ),
      Container(
          child: Column(children: <Widget>[
        Card(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            elevation: 5,
            child: TextField(
                decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Hotspot Name",
              contentPadding: const EdgeInsets.all(20.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
            ))),
        Card(
            margin: EdgeInsets.only(left: 10, top: 20, right: 10),
            elevation: 5,
            child: TextField(
                decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Tags(Bar, Playground, Cafe etc)",
              contentPadding: const EdgeInsets.all(20.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
            ))),
        Card(
            margin: EdgeInsets.only(left: 10, top: 20, right: 10),
            elevation: 5,
            child: TextField(
                decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Description",
              contentPadding: const EdgeInsets.all(20.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
            )))
      ])),
      Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange.shade700,
                padding: EdgeInsets.all(13),
                textStyle: TextStyle(fontSize: 20),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                )),
            child: Text("Create"),
            onPressed: () {},
          ))
    ]));
  }
}
