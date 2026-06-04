

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
               return Row(
                children: [
                  Column( children: [
                  Container(
                    alignment: AlignmentGeometry.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle
                      ),
                    child: Text(
                      data['question_index'].toString(),
                      textAlign: TextAlign.center,)
                    ),
                    SizedBox(height: 35,)]),
                    SizedBox(width: 10,),
                  Expanded( // doesnt grow more than the row's width
                    child: Column(
                    children: [
                      Text(data['question'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(data['correct_answer'].toString()
                      , style: TextStyle(
                        color: Colors.lightGreen
                      ),),
                      Text(data['user_answer'].toString()
                      , style: TextStyle(
                        color: Colors.amberAccent
                      ),),
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