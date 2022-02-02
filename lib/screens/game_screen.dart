// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:word_puzzle_game/widgets/keyboard_widget.dart';
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
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(flex: 7, child: WordleWidget()),
            Expanded(flex: 1, child: SubmitBarWidget()),
            Expanded(flex: 4, child: KeyboardWidget()),
          ],
        ),
      ),
    ));
  }
}
