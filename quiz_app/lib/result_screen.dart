

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';


class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});
  
  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length ; i++){
      summary.add({
        'question_index': i + 1,
        'question': questions[i].question,
        'correct_answer':questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final int totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctQuestions out of $totalQuestions questions correctly!',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ), 
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 32,),
            QuestionsSummary(summaryData),
            SizedBox(height: 32,),
            OutlinedButton.icon(
              onPressed: onRestart, 
              label: Text('Restart Quiz!', style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.refresh, color: Colors.white,),
              )
          ],
        ),
      ),
    );
  }
}