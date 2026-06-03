

import 'package:first_flutter_app/roll_dice.dart';
import 'package:flutter/material.dart';


const startAlignment = AlignmentGeometry.topStart;
const endAlignment = AlignmentGeometry.bottomEnd;

class GradientContainer extends StatelessWidget {

  // the parent class StatelessWidget needs a key parameter
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  // overidding the build method to build our custom widget
  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: startAlignment,
              end: endAlignment,
          )),
          child: Center(
            child: RollDice()
            ),
        );
  }
}