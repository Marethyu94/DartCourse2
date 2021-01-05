import 'package:flutter/material.dart';
import 'constantes.dart';

class ContenuIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  ContenuIcon({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: KLabelTexteStyle,
        ),
      ],
    );
  }
}