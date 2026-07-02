
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_memories_app/models/place.dart';
import 'package:travel_memories_app/widgets/image_input.dart';

class AddPlace extends StatelessWidget {

  AddPlace({super.key});

  @override
  Widget build(BuildContext context) {

    String placeName = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              child: TextField(maxLines: 1,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                placeName = value;
              },
              decoration: InputDecoration(
                label: Text('Title'),
              
              ),),
            ),
            SizedBox(height: 12,),
            ImageInput(),
            SizedBox(height: 12,),
            CupertinoButton.filled(
              sizeStyle: CupertinoButtonSize.medium,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [ Icon(CupertinoIcons.add), SizedBox(width: 4,) ,Text('Add Place') ],), 
              onPressed: () {
                Navigator.pop(context, Place(placeName));
              })
          ],
        ),
      ),
    );
  }
}