// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle_game/screens/game_screen.dart';

import 'models/word_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WordModel()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle App',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
