

import 'package:flutter/material.dart';

typedef OnMoreClicked = void Function();

class TitleRow extends StatelessWidget {
  final String text;

  final OnMoreClicked onMoreClicked;

  const TitleRow({super.key, required this.text, required this.onMoreClicked});

  @override 
  Widget build(context){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(16,16,0,8),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,
            color: Colors.white)),
          ), 
          const Spacer(),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(16,16,8,0),
            child: TextButton(
              onPressed: onMoreClicked , 
              child: const Text(
               'More',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
              ) 
              ),
          )
      ],
    );
  }
}