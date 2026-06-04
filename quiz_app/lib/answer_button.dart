

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  const AnswerButton({
  super.key, 
  required this.answer, 
  required this.onSelected
  });

  final void Function() onSelected;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 195, 42, 149),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40)
      ),
      onPressed: onSelected,
       child: Text(answer, textAlign: TextAlign.center,)
       );
  }


}