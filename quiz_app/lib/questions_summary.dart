

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {

  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 300,
      child: SingleChildScrollView( 
        child: Column(   
          children: summaryData.map(
            (data) {
               return Row(children: [
                  Text(data['question_index'].toString()),
                  Expanded( // doesnt grow more than the row's width
                    child: Column(
                    children: [
                      Text(data['question'].toString()),
                      const SizedBox(height: 5),
                      Text(data['correct_answer'].toString()),
                      Text(data['user_answer'].toString()),
                    ],
                    ),
                  )
               ],);
              }
          ).toList(),
        ),
      ),
    );
  }
}