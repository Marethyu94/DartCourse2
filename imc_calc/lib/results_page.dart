import 'package:flutter/material.dart';
import 'carte_reutilisable.dart';
import 'constantes.dart';
import 'bouton_inferieur.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.imcResultat,
        @required this.textInterpretation,
        @required this.textResultat});

  final String imcResultat;
  final String textResultat;
  final String textInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculette IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                child: Text(
                  'Votre résultat',
                  style: KTitreTextStyle,
                ),
              ),
          ),
          Expanded(
              flex: 5,
              child: CarteReutilisable(
                couleur: KCouleurContainerActif,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textResultat,
                      style: KResultatTextStyle,
                    ),
                    Text(
                      imcResultat,
                      style: KIMCTextStyle,
                    ),
                    Text(
                      textInterpretation,
                      style: KCorpsTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ),
          BoutonInferieur(
              titreBouton: 'RE-CALCULER',
              onAppui: () {
                Navigator.pop(context);
                },
          ),
        ],
      ),
    );
  }
}