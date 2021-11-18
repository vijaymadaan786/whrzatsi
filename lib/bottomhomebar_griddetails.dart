import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/photo.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;

  GridDetails({@required this.photo});

  @override
  _GridDetailsState createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(5, 46, 3, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: "image${widget.photo.userId}",
              // child: FadeInImage.assetNetwork(
              //     placeholder: "images/ic_logo.png",
              //     image: widget.photo.url),
            ),
            SizedBox(
              height: 30,
            ),
            OutlineButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
