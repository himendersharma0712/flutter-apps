
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_memories_app/models/place.dart';
import 'package:travel_memories_app/screens/add_place.dart';
import 'package:travel_memories_app/screens/place_info.dart';

class PlacesList extends StatefulWidget{
  
  PlacesList({super.key});

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {

  
  final List<Place> _places = [];

  void _addPlace() async {
  
    final newPlace =  await Navigator.push<Place>(context, MaterialPageRoute(builder: (context) => AddPlace()));
  
    if(newPlace != null){
      setState(() {
        _places.add(newPlace);
      });
  }
          
  }

  void openPlace(Place selectedPlace){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return PlaceInfo(place: selectedPlace,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    
    late Widget content;

    if(_places.isEmpty){
        content = Center(child: Text('No places added yet.',style: TextStyle(color: Colors.white),),);
    }

    if(_places.isNotEmpty){
        content = ListView.builder(
        itemCount: _places.length,
        itemBuilder: (place,index){
          final currentPlace = _places[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [ 
              CircleAvatar(
                radius: 26, 
                backgroundImage: FileImage(_places[index].image),

                ),
              TextButton(child: Text(_places.elementAt(index).title.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),),
              onPressed: (){
                openPlace(currentPlace);
              },)
              ]
              ),
          );
      });
      
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(onPressed: _addPlace, icon: Icon(CupertinoIcons.add))
        ],
      ),
      body: content ,
    );
  }
}