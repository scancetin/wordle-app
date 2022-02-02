// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:word_puzzle_game/widgets/submit_bar_widget.dart';
import 'package:word_puzzle_game/widgets/wordle_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[850],
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(color: Colors.greenAccent),
            ),
            Expanded(
              flex: 14,
              child: WordleWidget(),
            ),
            Expanded(flex: 2, child: SubmitBarWidget()),
            Expanded(flex: 6, child: Container(color: Colors.blueAccent)),
          ],
        ),
      ),
    ));
  }
}
