import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whrzats/home.dart';
import 'package:whrzats/signup.dart';
import 'package:whrzats/verification_otp.dart';
import 'package:http/http.dart' as http;


String Phone = "";

class WeLogins extends StatefulWidget {g
  @override
  _WeLoginState createState() => _WeLoginState();
}

class _WeLoginState extends State<WeLogins> {
   Future<Post> post;
  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
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
  String url="https://whrzat.com:8001/api/customer/customerLogIn";
  final response = await http.post(Uri.parse(url),
  body: jsonEncode(<String, String>{
  // {"contact": "6239687412", "code": "+91", "deviceType": "ANDROID", "timeZone": "19800"}

    "contact" : Phone, "code" : "+91", "deviceType" : "ANDROID", "timeZone" : "19000"

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
  Post({  this.phonenum});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      phonenum: json['phonenumber'],
    );
  }
}

class WeLogin extends StatelessWidget {
  @override
  final  myController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 45,
            ),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );

              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 17),
            alignment: Alignment.topLeft,
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 9.0, top: 4),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Enter your registered mobile number to login.",
              style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.only(left: 15, top: 50, right: 15),
            child: TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Phone number",
                hintStyle:
                    TextStyle(color: Colors.grey, fontFamily: 'OpenSans'),
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9))),
              ),
            ),

          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15, 60, 15, 0),
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
                Phone = myController.text.toString();
                fetchPost();
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
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}