import 'package:flutter/material.dart';

void main() => runApp(Quizzler());


class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int compteurQuestion = 0;
  int bonnerep = 0;
  List<Icon> compteurPoints = []; // Liste Vide
  List<String> questions = [
    "La boite noire d'un avion commercial est de couleur noire.",
    "Les éléphants ont peur des souris.",
    "La durée d'un jour a toujours été de 24 heures.",
    "Paris est plus au nord que Québec, Munich et Genève.",
    "La société Coca-Cola a créé l'image moderne du Père Noël.",
    "Les autruches mettent la tête dans le sable quand elles ont peur.",
    "Le sens de rotation de l'eau dans un lavabo dépend de l'hémisphère dans lequel on se trouve.",
    "Une femme divorcée doit attendre 300 jours avant de se remarier.",
    "Seuls les moustiques femelles piquent.",
    "Aux Etats-Unis, il n'y a pas d'étage n° 13 dans les gratte-ciel.",
    "Les cheveux et les ongles continuent de pousser après la mort.",
    "Il est impossible d'éternuer les yeux ouverts.",
    "Le muscle le plus puissant du corps humain est la langue.",
    "Les Vikings et les Indiens se sont rencontrés au début du 11e siècle.",
    "La lune s'éloigne de la Terre.",
    "Les vrais jumeaux n'ont pas les mêmes empreintes digitales.",
  ];
  List<bool> reponses = [
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[compteurQuestion],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                  'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (reponses[compteurQuestion] == true) {
                    compteurPoints.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    bonnerep += 1;
                  }
                  else {
                    compteurPoints.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  if (compteurQuestion < 15) {
                    compteurQuestion += 1;
                  }
                  else
                    {
                      questions.add("Le quizz est terminé, votre score est de : $bonnerep / 16");
                      compteurQuestion = 16;
                    }
                },
                );
              },
              ),

            ),
          ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(reponses[compteurQuestion] == false)
                  {
                  compteurPoints.add(
                  Icon(
                  Icons.check,
                  color: Colors.green,
                  ),
                  );
                  bonnerep += 1;
                  }
                  else
                  {
                  compteurPoints.add(
                  Icon(
                  Icons.close,
                  color: Colors.red,
                  ),
                  );
                  }
                  if (compteurQuestion < 15) {
                    compteurQuestion += 1;
                  }
                  else
                  {
                    questions.add("Le quizz est terminé, votre score est de : $bonnerep / 16");
                    compteurQuestion = 16;
                  }
                });
                  }
                ),
            ),
          ),
        Row(
          children: compteurPoints,
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
