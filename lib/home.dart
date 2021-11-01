import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whrzats/login.dart';
import 'package:whrzats/signup.dart';
import 'package:whrzats/webview.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false, // 1
            systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
          ),
          // brightness: Brightness.light,
          primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 90),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/firelogo.png",
                    height: 130,
                    width: 170,
                  ),
                ),
              ]),
            )),
            // Column(
            //   children: <Widget>[
            // Padding(padding: EdgeInsets.only(top: 50.0)),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
                      child: Text(
                        "Find Where it's at!",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 27,
                          // fontFamily: 'opensansbold'
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'Explore with whrzAt to find exciting live activity and',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              )),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: ' Share places to go',
                            style: TextStyle(
                                fontFamily: 'OpenSans', color: Colors.black)),
                      ]),
                    ),
                  ]),
            )),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrange.shade700,
                                  padding: EdgeInsets.all(13),
                                  textStyle: TextStyle(fontSize: 20),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                  )),
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                // GestureDetector(
                                //   onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ),
                                );
                              },
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(12, 0, 12, 2),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  padding: EdgeInsets.all(13),
                                  textStyle: TextStyle(fontSize: 20),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                    side: BorderSide(
                                        color: Colors.red, width: 0.5),
                                  )),
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.deepOrange.shade700),
                              ),
                              onPressed: () {
                                // GestureDetector(
                                //   onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WeLogin(),
                                  ),
                                );
                              },
                            ),
                          ),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(top: 10.0),
                                // padding: (EdgeInsets.only(top: 10.0)),
                                child: Text(
                                  "By signing in you agree with our ",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans', color: Colors.grey
                                      // fontFamily: 'OpenSans-Bold'
                                      ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WebViewContainer(
                                                  "https://www.google.com"),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Terms & Conditions",
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          ),
                        ])))
          ],
        ),
      ),
    );
  }
}
//                        Center(
// child: SelectableLinkify(
// text: 'Select this', style: TextStyle(fontSize: 25),
// onOpen: _opOpen,
// )
// )
// ],

// onOpen: (link) async {
//   if (await canLaunch(link.url)) {
//     await launch(link.url);
//   } else {
//     throw 'Could not launch $link';
//   }
// },
// text: "Made by https://cretezy.com",
// style: TextStyle(color: Colors.yellow),
// linkStyle: TextStyle(color: Colors.red),

// SizedBox(
//   width: double.infinity,
//   child: new MaterialButton(
//     height: 40.0,
//     minWidth: 190.0,
//     color: Colors.deepOrange,
//     textColor: Colors.white,
//     child: new Text("Sign Up"),
//     onPressed: () => {},
//     splashColor: Colors.redAccent,
//   ),
// ),
// SizedBox(
//     width: double.infinity,
//     child: ElevatedButton(
//         onPressed: () {},
//         style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all(Colors.white),
//             textStyle: MaterialStateProperty.all(
//                 TextStyle(fontSize: 30))),
//         child: Text(
//           "Log In",
//           style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepOrange),
//         )))
