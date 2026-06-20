import 'package:flutter/material.dart';
import 'package:gamewatch/main_screen.dart';
import 'package:gamewatch/ui/theme/theme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget{

  const MainApp({super.key});

  @override
  State<MainApp> createState(){
    return _MainAppState();
  }
}


class _MainAppState extends State<MainApp> {

  @override
  Widget build(context){
    return MaterialApp(
      theme: createTheme(),
      title: 'Games',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}