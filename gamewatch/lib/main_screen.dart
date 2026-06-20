import 'package:flutter/material.dart';
import 'package:gamewatch/ui/screens/home/home_screen.dart';


class MainScreen extends StatefulWidget{

    const MainScreen({super.key});

    @override
  State<MainScreen> createState() {
     return _MainScreenState();
  }
}



class _MainScreenState extends State<MainScreen> {

  var index = 0;
  final List<Widget> screens = <Widget>[];


  @override 
  void initState(){
    super.initState();
    screens.add(const HomeScreen());
    screens.add(const Placeholder());
    screens.add(const Placeholder());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.theater_comedy), label: 'Genre'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites')
        ],
        currentIndex: index ,
        onTap: (navIndex){
          setState(() {
            index = navIndex;
          });
        },
        ),
    );
  }
}

