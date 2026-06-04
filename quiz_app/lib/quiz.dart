import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/question_screen.dart';


class Quiz extends StatefulWidget {

  const Quiz({super.key});

  @override
  State <Quiz> createState(){
      return _QuizState();
  }

}

class _QuizState extends State<Quiz> {

  // Widget? currentScreen;

  // this method only runs once to initialize variables 
  // called after object creation
  // @override 
  // void initState(){
  //   currentScreen = HomeScreen(changeScreen);
  //   super.initState();
  // }

  // void changeScreen(){
  //   setState(() {
  //     currentScreen = QuestionScreen();
  //   });
  // }

  // #method 2 -> use strings
  
  var currentScreen = 'home-screen';

  void changeScreen(){
    setState(() {
      currentScreen = 'question-screen';
    });
  }


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
          child: currentScreen == 'home-screen' ? HomeScreen(changeScreen) : const QuestionScreen(),
          ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}