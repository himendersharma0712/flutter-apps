import 'package:first_flutter_app/gradient_container.dart';
import 'package:flutter/material.dart'; // runApp() is defined in material.dart file 

void main() {
  // main function is the main entry point of the program
  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.pinkAccent,
        body: GradientContainer(colors: [Colors.cyan,Colors.green,Colors.redAccent]) // our custom widget object
        ),
      debugShowCheckedModeBanner: false,
    ),
  ); // tells Flutter what to display on screen
}

// MaterialApp widget -> A convenience widget that wraps a number of widgets 
// that are commonly required for Material Design applications. It sets up the overall app.

// Scaffold:  Implements the basic Material Design visual layout structure.

// named parameters 
// void add({num1,num2}) => num1 + num2;
// add(num2: 5, num1: 3);

// need to inherit from StatelessWidget class to make a custom widget
// which doesnt need to track a state (say of an integer variable or a string variable)

