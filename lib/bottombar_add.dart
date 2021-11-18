import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddState extends StatefulWidget {
  @override
  _AddStateState createState() => _AddStateState();
}

class _AddStateState extends State<AddState> {
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {;

    GeolocatorPlatform.instance
        .getCurrentPosition(forceAndroidLocationManager: true);
    final position = await Geolocator.getCurrentPosition();
    _currentPosition = position;
    _getAddressFromLatLng();
  }

  // _getAddressFromLatLng() async {
  //   print("getCurrent Address From LatLng");
  //   try {
  //     //  Geolocator geo = Geolocator();
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         _currentPosition.latitude, _currentPosition.longitude);
  //     Placemark place = placemarks[0];
  //     print("--------------------------------------------------");
  //     print(placemarks[0]);
  //
  //     setState(() {
  //       _currentAddress = "${place.street}, ${place.subLocality}, "
  //           // "${place.locality}"
  //           "";
  //     }
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 23),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Add Hotspot",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 21),
                  ),
                ),
              ])),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage('assets/images/icmap.png'),
            color: Colors.red,
          ),
          Column(
            children: <Widget>[
              if (_currentPosition != null && _currentAddress != null)
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(_currentAddress,
                      style: Theme.of(context).textTheme.bodyText2),
                )
            ],
          ),
        ],
      ),
      Card(
          child: Column(children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: 200,
          width: 365,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
            image: new DecorationImage(
              alignment: Alignment.center,
              image: new AssetImage('assets/images/ic_add_hotspot.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 49),
            child: Text(
              "Add Hotspot Image",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
            ),
          ),
        ),
        Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, top: 30),
                child: Text(
                  "HOTSPOT NAME",
                  style: TextStyle(
                      fontSize: 18,fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
              ),
              Card(
                  margin: EdgeInsets.only(left: 10, top: 15, right: 10),
                  elevation: 5,
                  child: TextFormField(
                      style: TextStyle(color: Colors.grey.shade600),
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
            margin: EdgeInsets.all(11),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange.shade700,
                  padding: EdgeInsets.all(13),
                  textStyle: TextStyle(fontSize: 20, fontFamily: 'OpenSans'),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  )),
              child: Text("Create"),
              onPressed: () {},
            ))
      ]))
    ]));
  }
  _getAddressFromLatLng() async {
    try {
      //  Geolocator geo = Geolocator();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.street}, ${place.subLocality}, "
        // "${place.locality}"
            "";
      }
      );
    } catch (e) {
      print(e);
    }
  }
}