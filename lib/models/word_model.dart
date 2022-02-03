// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class WordModel extends ChangeNotifier {
  final List<Word> _wordList = [];
  final List<String> _letterList = [];
  final String _correctWord = "WORDL";
  final Map<String, Color> _keyColors = {};

  List<Word> get wordList => _wordList;
  List<String> get letterList => _letterList;
  String get correctWord => _correctWord;
  Map<String, Color> get keyColors => _keyColors;

  int get totalWord => _wordList.length;
  int get totalLetter => _letterList.length;

  void addWord(Word newWord) {
    letterList.clear();
    wordList.add(newWord);
    if (newWord.word == correctWord) {
      print("correct guess");
    }
    notifyListeners();
  }

  void addLetter(String newLetter) {
    letterList.add(newLetter);
    notifyListeners();
  }

  void deleteLetter() {
    letterList.removeLast();
    notifyListeners();
  }

  void keyboardColor(String key, Color color) {
    if (keyColors.containsKey(key)) {
      if (color == Colors.green) {
        keyColors[key] = Colors.green;
      } else if (color == Colors.orange && keyColors[key] != Colors.green) {
        keyColors[key] = Colors.orange;
      } else if (color == Colors.blueGrey) {
        keyColors[key] = Colors.blueGrey;
      }
    } else {
      keyColors[key] = color;
    }
  }

  String fillBoxes(int wordIndex, int letterIndex) {
    if (totalWord > wordIndex) {
      return wordList[wordIndex].word[letterIndex];
    } else if (totalWord == wordIndex && totalLetter > letterIndex) {
      return letterList[letterIndex];
    }
    return "";
  }

  Color boxColor(String letter, int wordIndex, int letterIndex) {
    if (totalWord > wordIndex) {
      if (correctWord[letterIndex] == letter) {
        return Colors.green;
      } else if (correctWord.contains(letter)) {
        return Colors.orange;
      }
      return Colors.blueGrey;
    }
    return Colors.white;
  }
}

class Word {
  late final String word;
  Word(this.word);
}
