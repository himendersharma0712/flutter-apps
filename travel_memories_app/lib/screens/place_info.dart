
import 'package:flutter/material.dart';
import 'package:travel_memories_app/models/place.dart';

class PlaceInfo extends StatelessWidget{

  const PlaceInfo({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
        child: Text(place.title, style: TextStyle(color: Colors.white),),
      ),
    );
  }

}