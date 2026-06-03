

import 'package:flutter/material.dart';



class StylizedText extends StatelessWidget{

  final String textString;
  StylizedText(this.textString,{super.key});

  @override
  Widget build(context) {
    return Text(
      textString,
      style: TextStyle(
        fontSize: 50,
        color: Colors.yellowAccent
      ),
    );
  }
}