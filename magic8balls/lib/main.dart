import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("magic8ball"),
          backgroundColor: Colors.black,
        ),
        body: Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8Ball createState() => _Magic8Ball();
}

class _Magic8Ball extends State<Magic8Ball> {
  // This widget is the root of your application.
  @override
  int numball = 1;

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic8Ball',
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("Ask Me Anything"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        numball = Random().nextInt(5) + 1;
                      });
                    },
                    child: Image.asset("images/ball$numball.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}