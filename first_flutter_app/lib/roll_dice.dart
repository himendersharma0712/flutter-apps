
import 'package:flutter/material.dart';
import 'dart:math';

// we always need two classes to define a stateful Widget

class RollDice extends StatefulWidget {

    const RollDice({super.key});
    
    @override
    State<RollDice> createState(){
      return _RollDiceState();
    }
}

// underscore preceded classes are private classes
class _RollDiceState extends State<RollDice> {

  final randomGenerator = Random();

  var numberRolled = 1;

  void rollDice(){
    // next Int generates a number from 0 to max where max is exclusive
    setState(() { // this will lead to build() be re-executed
      numberRolled = randomGenerator.nextInt(6) + 1;;
    });
  }
  
  @override
  Widget build(context){
      return Column( // Center() centers the column horizontally but column takes the entire space
              // spacing: 11.0, // adds space between elements
              mainAxisSize: MainAxisSize.min, // needed to center it 
              children: [
                Image.asset('assets/images/dice-$numberRolled.png', width: 200,),
                const SizedBox(height: 11.0,), // ghost widget that doesnt display anything but adds a space 
                ElevatedButton(
                  onPressed: rollDice, 
                  child: Text('Roll Dice')
                  )
                ]
            );
  }
}