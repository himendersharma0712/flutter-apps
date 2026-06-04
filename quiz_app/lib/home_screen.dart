import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Opacity(
              //   opacity: 0.5,
              //   child: Image.asset(
              //     'assets/images/quiz-logo.png',
              //     width:300,
              //   ),
              // ),
              Image.asset(
                  'assets/images/quiz-logo.png',
                  width:300,
                  color: const Color.fromARGB(148, 255, 255, 255) ,
                ),
              SizedBox(height: 80,),
              const Text(
              'Learn Flutter the fun way!', 
              style: TextStyle(color: Colors.white,fontSize: 25) ,
              ),
              SizedBox(height: 28,),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.arrow_right_alt),
                onPressed: startQuiz, 
                label: const Text('Start Quiz',)
                )
            ]
          )
    );
  }

}