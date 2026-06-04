import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';


class Quiz extends StatefulWidget {

  const Quiz({super.key});

  @override
  State <Quiz> createState(){
      return _QuizState();
  }

}

class _QuizState extends State<Quiz> {

  @override
  Widget build(context){
      return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topStart,
              colors: [
                const Color.fromARGB(255, 33, 151, 177),
                const Color.fromARGB(255, 20, 84, 158)
              ],
              end: AlignmentGeometry.bottomEnd
              )
            ),
          child: HomeScreen()
          ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}