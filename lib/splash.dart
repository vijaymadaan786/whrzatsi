import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whrzats/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/launcher.png'),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text("Xperge",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
            ],
            // Image.asset("assets/images/firelogo.jpg"
          ),
        ],
      ),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
//                         text: 'By signing in you agree with our terms & conditions.',style: TextStyle(
//                         fontSize: 25),
//                         onOpen: _onOpen,
//                         ),
// ),
//                        Center(
// child: SelectableLinkify(
// text: 'Select this', style: TextStyle(fontSize: 25),
// onOpen: _opOpen,
// )
// )
// ],),)
// Future(<void>)_onOpen(LinkableElement link(async){
//   if(await canLaunch(link.url)){
// await launch(link.url);
// }
//   else{
//     throw('cannot open link $link');
// }
// }
