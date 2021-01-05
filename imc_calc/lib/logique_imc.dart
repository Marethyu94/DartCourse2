import 'dart:math';
import 'constantes.dart';

class LogiqueImc {
  final int hauteur;
  final double poids;
  double _imc; //variable private

  LogiqueImc({this.hauteur, this.poids});

  String calculIMC() {
    // imc = kg / (metre^2)
    _imc = poids /pow(hauteur/100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResultat() {
    if (_imc < 16.5)
      {
        return 'dénutrition ou anorexie';
      }
    else if (_imc > 16.5 && _imc <= 18.5)
    {
      return 'maigreur';
    }
    else if (_imc > 18.5 && _imc <= 25)
    {
      return 'poids normal';
    }
    else if (_imc > 25 && _imc <= 30)
    {
      return 'surpoids';
    }
    else if (_imc > 30 && _imc <= 35)
    {
      return 'obésité modérée';
    }
    else if (_imc > 35 && _imc <= 40)
    {
      return 'obésité sévère';
    }
    else
      {
        return 'obésité morbide ou massive';
      }

  }

  String getInterpretation() {
    {
      if (_imc >= 25.0) {
        return 'Faites plus d\'exercices !';
      }
      else if (_imc > 18.5) {
        return 'Super !';
      }
      else {
        return 'Mangez un peu plus !';
      }
    }
  }

}