import 'package:flutter/material.dart'; // runApp() is defined in material.dart file 

void main() {
  // main function is the main entry point of the program
  runApp(
    const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello Flutter'),)),
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