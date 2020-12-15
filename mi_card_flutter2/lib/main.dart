import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/FE_flamme.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea (
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/tenor.gif'),
                ),
                Text(
                  "Elmo ",
                  style: TextStyle(
                    fontFamily: 'Blazed',
                    fontSize: 40.0,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "Le diabolique",
                  style: TextStyle(
                    fontFamily: 'Blazed',
                    fontSize: 20.0,
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: <Widget> [
                      Icon(Icons.call),
                      SizedBox(width:10.0),
                      Text(
                        "+33 6 28 66 41 XX",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: <Widget> [
                      Icon(Icons.mail),
                      SizedBox(width:10.0),
                      Text(
                        "romain.labbe2@gmail.com",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
