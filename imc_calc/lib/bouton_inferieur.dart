import 'package:flutter/material.dart';
import 'constantes.dart';

class BoutonInferieur extends StatelessWidget {
  final Function onAppui;
  final String titreBouton;

  BoutonInferieur({@required this.onAppui, @required this.titreBouton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        child: Text(
          titreBouton,
          style: KBoutonTextStyle,
        ),
        color: KCouleurContainerInferieur,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KHauteurContainerInferieur,
      ),
    );
  }
}

