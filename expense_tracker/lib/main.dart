import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';



var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 147, 45, 230));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(0, 18, 18, 227));

void main(){

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations( // locks device orientation for our app
  //   [DeviceOrientation.portraitUp]
  // ).then((fn) {
      runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer
          )
        ),
        appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kDarkColorScheme.onPrimaryContainer,
        foregroundColor: kDarkColorScheme.primaryContainer,
        toolbarHeight: 65,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)
      ),
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData(color: Color.fromARGB(255, 119, 59, 164))
      ),
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 177, 205, 237),
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
        toolbarHeight: 65,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer
        )
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(fontWeight: FontWeight.bold,
        color: kColorScheme.onSecondaryContainer,
        fontSize: 17,
        letterSpacing: 1,
        ))
      ),
      home: Expenses(),
      debugShowCheckedModeBanner: false,
    )
  );  
  // });
}

// we copy a pre-built theme with copyWith() and change only some attributes 
// as per our need