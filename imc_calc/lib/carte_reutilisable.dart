import 'package:flutter/material.dart';
import 'constantes.dart';

class CarteReutilisable extends StatelessWidget {
  final Color couleur;
  final Widget cardChild;

  CarteReutilisable({@required this.couleur, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: 170.0,
    );
  }
}