// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle_game/models/word_model.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      keyboardButton("Q"),
                      keyboardButton("W"),
                      keyboardButton("E"),
                      keyboardButton("R"),
                      keyboardButton("T"),
                      keyboardButton("Y"),
                      keyboardButton("U"),
                      keyboardButton("I"),
                      keyboardButton("O"),
                      keyboardButton("P"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Spacer(),
                      keyboardButton("A"),
                      keyboardButton("S"),
                      keyboardButton("D"),
                      keyboardButton("F"),
                      keyboardButton("G"),
                      keyboardButton("H"),
                      keyboardButton("J"),
                      keyboardButton("K"),
                      keyboardButton("L"),
                      Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      keyboardButton("Z"),
                      keyboardButton("X"),
                      keyboardButton("C"),
                      keyboardButton("V"),
                      keyboardButton("B"),
                      keyboardButton("N"),
                      keyboardButton("M"),
                      deleteKey(Icons.backspace),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(height: 50, color: Colors.yellow),
      ],
    );
  }

  Widget keyboardButton(String key) {
    return Expanded(
      flex: 2,
      child: Consumer<WordModel>(
        builder: (context, model, child) {
          Color? _color = model.keyColors.containsKey(key) ? model.keyColors[key] : Colors.white;
          return Padding(
            padding: EdgeInsets.all(2),
            child: ElevatedButton(
              onPressed: () {
                if (model.totalLetter < 5 && model.totalWord < 6) {
                  // klavye eklenecek
                  Provider.of<WordModel>(context, listen: false).addLetter(key);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: _color,
                minimumSize: Size(double.infinity, double.infinity),
              ),
              child: Text(
                key,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _color == Colors.white ? Colors.black : Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget deleteKey(IconData icon) {
    return Expanded(
      flex: 4,
      child: Consumer<WordModel>(
        builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.all(2),
            child: ElevatedButton(
                onPressed: () {
                  if (model.totalLetter > 0 && model.totalWord < 6) {
                    Provider.of<WordModel>(context, listen: false).deleteLetter();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(double.infinity, double.infinity),
                ),
                child: Icon(icon, size: 30, color: Colors.black)),
          );
        },
      ),
    );
  }
}
