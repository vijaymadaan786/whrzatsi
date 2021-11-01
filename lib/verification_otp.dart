import 'package:flutter/material.dart';
import 'package:whrzats/home_screen.dart';
import 'package:whrzats/signup.dart';

class Verificationotp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(children: <Widget>[
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 25, left: 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Verification Code',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18, top: 2),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "We texted you a code to verify your number",
                        style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.only(left: 15, top: 60, right: 15),
                        elevation: 5,
                        child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Enter WhrzAt code",
                              contentPadding: const EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                            ))),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(15, 45, 15, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange.shade700,
                            padding: EdgeInsets.all(13),
                            textStyle: TextStyle(fontSize: 20),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                            )),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontFamily: 'OpenSans'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreenState(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ]),
        ));
  }
}
// return Scaffold(
//     body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//   children: <Widget>[
//     Text(
//       "Enter Verification Code"
//     )
// Container(
//     child: IconButton(
//   icon: Icon(Icons.arrow_back_ios_sharp),
//   onPressed: () {
//     Navigator.pop(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Signup(),
//       ),
//     );
//   },
// ))
