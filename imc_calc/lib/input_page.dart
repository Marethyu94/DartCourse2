import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contenu_icon.dart';
import 'carte_reutilisable.dart';
import 'constantes.dart';
import 'results_page.dart';
import 'bouton_inferieur.dart';
import 'bouton_arrondi_icone.dart';
import 'logique_imc.dart';

enum Genre {
  homme,
  femme,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genre selection;
  Color couleurCarteHomme = KCouleurContainerInactif;
  Color couleurCarteFemme = KCouleurContainerInactif;

  void updateCouleur (int selection) {
    //carte Homme appuyée
    if (selection == Genre.homme) {
      if (couleurCarteHomme == KCouleurContainerInactif) {
        couleurCarteHomme = KCouleurContainerActif;
        couleurCarteFemme = KCouleurContainerInactif;
      }else{
        couleurCarteHomme = KCouleurContainerInactif;
      }
    }
    //carte Femme appuyée
    if (selection == Genre.femme) {
      if (couleurCarteFemme == KCouleurContainerInactif) {
        couleurCarteFemme = KCouleurContainerActif;
        couleurCarteHomme = KCouleurContainerInactif;
      }else{
        couleurCarteFemme = KCouleurContainerInactif;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateCouleur(Genre.homme);
                        selection = Genre.homme;
                      });
                    },
                    child: CarteReutilisable(
                      couleur: selection == Genre.homme ? KCouleurContainerActif : KCouleurContainerInactif,
                      cardChild: ContenuIcon(
                        icon: FontAwesomeIcons.mars,
                        label: 'Homme',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateCouleur(Genre.femme);
                        selection = Genre.femme;
                      });
                    },
                    child: CarteReutilisable(
                      couleur: selection == Genre.femme ? KCouleurContainerActif : KCouleurContainerInactif,
                      cardChild: ContenuIcon(
                        icon: FontAwesomeIcons.venus,
                        label: 'Femme',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CarteReutilisable(
              couleur: KCouleurContainerActif,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hauteur',
                    style: KLabelTexteStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        KHauteur.toString(),
                        style: KNombreTexteStyle,
                      ),
                      Text(
                        'cm',
                        style: KLabelTexteStyle,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: KSliderActif,
                        inactiveTickMarkColor: KSliderInactif,
                        thumbColor: KSliderActif,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: KHauteur.toDouble(),
                        min: KHauteurMin,
                        max: KHauteurMax,
                        onChanged: (double nouvelleValeur){
                          setState(() {
                            KHauteur = nouvelleValeur.toInt();
                          });
                        },
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CarteReutilisable(
                    couleur: KCouleurContainerActif,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Poids',
                          style: KLabelTexteStyle,
                        ),
                        Text(
                          poids.toString(),
                          style: KNombreTexteStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BoutonArrondiIcone(
                                icone: FontAwesomeIcons.minus,
                                appuye: () {
                                  setState(() {
                                    poids = poids - 0.5;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              BoutonArrondiIcone(
                                icone: FontAwesomeIcons.plus,
                                appuye: () {
                                  setState(() {
                                    poids = poids + 0.5;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CarteReutilisable(
                    couleur: KCouleurContainerActif,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Âge',
                          style: KLabelTexteStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNombreTexteStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BoutonArrondiIcone(
                                icone: FontAwesomeIcons.minus,
                                appuye: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              BoutonArrondiIcone(
                                icone: FontAwesomeIcons.plus,
                                appuye: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BoutonInferieur(
            titreBouton: 'CALCULATE',
            onAppui: () {
              LogiqueImc calc = LogiqueImc(hauteur: KHauteur, poids: poids);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    imcResultat: calc.calculIMC(),
                    textResultat: calc.getResultat(),
                    textInterpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
