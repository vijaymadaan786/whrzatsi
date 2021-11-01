import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:whrzats/home.dart';
import 'package:whrzats/login.dart';
import 'package:whrzats/verification_otp.dart';
import 'package:http/http.dart' as http;

String Phone = "";

class Signups extends StatefulWidget {
  @override
  _SignupsState createState() => _SignupsState();
}

class _SignupsState extends State<Signups> {
  Future<Post> post;
  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Post>(
        future: post,
        builder: (context, abc) {
          if (abc.hasData) {
            return Text(abc.data.phonenum.toString());
          } else if (abc.hasError) {
            return Text("${abc.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<Post> fetchPost() async {
  String url = "http://whrzat.com:8001/api/customer/customerSignUp";
  final response = await http.post(Uri.parse(url),
      body: jsonEncode(<String, String>{
        // "contact" : Phone, "code" : "+91", "deviceType" : "ANDROID", "timeZone" : "19000"
        "contact": Phone,
        "code": "+91",
        "bio": "test user",
        "email": "test12@gmail.com",
        "deviceId": "6728682hsjdhsj",
        "name": "test user",
        "deviceType": "Android",
        "fromFacebook": "false",
        "password": "123456",
        "timeZone": "19800",
      }));
  print("hello");
  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the call to the server was successful (returns OK), parse the JSON.
    print(json.decode(response.body));
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int phonenum;
  final String name;
  final String bio;

  Post({this.phonenum, this.name, this.bio});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      phonenum: json['phonenum'],
      name: json['name'],
      bio: json['bio'],

    );
  }
}

class Signup extends StatelessWidget {
  final  myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Column(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 20, left: 17),
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 8, left: 17),
            child: Text(
              "Enter your details to sign up.",
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 17),
            child: Image.asset("assets/images/imageplaceholder.png",
                height: 115, width: 148),
          ),
          Card(
            margin: EdgeInsets.only(left: 15, top: 20, right: 15),
            elevation: 5,
            child: TextField(
                decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Full Name",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
            )),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                )),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: TextField(
                decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Bio (Optional)",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
            )),
          ),
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
                "Continue",
                style: TextStyle(fontFamily: 'OpenSans'),
              ),
              onPressed: () {
                print(myController.text);
                // Phone = myController.text.toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Verificationotp(),
                  ),
                );
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(12, 35, 12, 0),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeLogin(),
                            ),
                          ),
                  ),
                ]),
              ))
        ])
      ]))),
    );
  }
}

//not directing into login page
