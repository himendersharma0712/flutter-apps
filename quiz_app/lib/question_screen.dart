import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {

  const QuestionScreen({super.key, required this.onSelectAnswer});
  
  final void Function(String answer) onSelectAnswer;

  @override
  State <QuestionScreen> createState(){
    return _QuestionScreenState();
  }

}


class _QuestionScreenState extends State <QuestionScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context){

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(45),
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(
            currentQuestion.question, 
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
              ),
            textAlign: TextAlign.center,
            ),
          const SizedBox(height: 32,),
          ...currentQuestion.getShuffledAnswers().map(
            (answer) {
               return AnswerButton(answer: answer, onSelected: () { answerQuestion(answer);  });
               }
          )
        ],),
      ),
    );
  }
}