import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';


var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 147, 45, 230));

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 177, 205, 237),
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
        toolbarHeight: 65,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)
      )
      ),
      home: Expenses(),
      debugShowCheckedModeBanner: false,
    )
  );  
}