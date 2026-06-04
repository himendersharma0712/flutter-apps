

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key, required this.chosenAnswers});
  
  final List<String> chosenAnswers;

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
            style: TextStyle(fontSize: 20) ,),
            SizedBox(height: 32,),
            QuestionsSummary(summaryData),
            SizedBox(height: 32,),
            TextButton(
              onPressed: () {}, 
              child: Text('Restart Quiz') 
              )
          ],
        ),
      ),
    );
  }
}