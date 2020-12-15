import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Jeu de dés"),
          backgroundColor: Colors.red,
        ),
        body: JeuDeDes(),
      ),
    ),
  );
}

class JeuDeDes extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _JeuDeDes createState() => _JeuDeDes();
}

class _JeuDeDes extends State<JeuDeDes> {
  @override
  int faceDeGauche = 1;
  int faceDeDroite = 1;
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all((16.0)),
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      faceDeGauche = Random().nextInt(6) + 1;
                      faceDeDroite = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset("images/dice$faceDeGauche.png")),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all((16.0)),
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      faceDeDroite = Random().nextInt(6) + 1;
                      faceDeGauche = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset("images/dice$faceDeDroite.png")),
            ),
          ),
        ],
      ),
    );
  }
}
