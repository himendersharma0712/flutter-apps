

import 'package:flutter/material.dart';
import 'package:gamewatch/ui/screens/home/home_screen_image.dart';
import 'package:gamewatch/ui/screens/home/horiz_movies.dart';
import 'package:gamewatch/ui/screens/home/title_row.dart';
import 'package:gamewatch/ui/theme/theme.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}


class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: screenBackground,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,16,0,24),
                  child: Text(
                    'Now Playing',
                    style: largeTitle,
                  ),
                ),
                ),
                HomeScreenImage(),
                TitleRow(text: 'Trending', onMoreClicked: () {}),
                HorizontalMovies(movies: images),
                TitleRow(text: 'Popular', onMoreClicked: () {}),
                HorizontalMovies(movies: images),
                TitleRow(text: 'Top rated', onMoreClicked: () {}),
                HorizontalMovies(movies: images),
            ],
          ),
        ),
      ),
    );
  }
}