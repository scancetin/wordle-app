// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle_game/models/word_model.dart';

class WordleWidget extends StatelessWidget {
  const WordleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        wordsArea(0),
        wordsArea(1),
        wordsArea(2),
        wordsArea(3),
        wordsArea(4),
        wordsArea(5),
      ],
    );
  }

  Widget wordsArea(int wordIndex) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          letterBox(wordIndex, 0),
          letterBox(wordIndex, 1),
          letterBox(wordIndex, 2),
          letterBox(wordIndex, 3),
          letterBox(wordIndex, 4),
        ],
      ),
    );
  }

  Consumer letterBox(int wordIndex, int letterIndex) {
    return Consumer<WordModel>(
      builder: (context, model, child) {
        double _boxSize = MediaQuery.of(context).size.width * 0.16;
        String _letter = model.fillBoxes(wordIndex, letterIndex);
        Color _color = model.boxColor(_letter, wordIndex, letterIndex);
        return SizedBox(
          width: _boxSize,
          height: _boxSize,
          child: Card(
            margin: EdgeInsets.all(5),
            color: _color,
            shadowColor: Colors.black,
            child: Center(
              child: Text(
                _letter,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: _color == Colors.white ? Colors.black : Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
