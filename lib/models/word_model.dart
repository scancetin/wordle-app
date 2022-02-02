import 'package:flutter/material.dart';

class WordModel extends ChangeNotifier {
  final List<Word> _wordList = [];
  final List<String> _letterList = [];
  final String _correctWord = "WORDL";

  List<Word> get wordList => _wordList;
  List<String> get letterList => _letterList;
  String get correctWord => _correctWord;

  int get totalWord => _wordList.length;
  int get totalLetter => _letterList.length;

  void addWord(Word newWord) {
    _letterList.clear();
    _wordList.add(newWord);
    notifyListeners();
  }

  void addLetter(String newLetter) {
    _letterList.add(newLetter);
    notifyListeners();
  }

  void deleteLetter() {
    _letterList.removeAt(totalLetter - 1);
    notifyListeners();
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
    // green 459525
    // yellow C8A111
    // white FFFFFF
    // grey 474B4D

    if (totalWord > wordIndex) {
      if (correctWord[letterIndex] == letter) {
        return Colors.green;
      } else if (correctWord.contains(letter)) {
        return Colors.yellow;
      }
      return Colors.grey;
    }
    return Colors.white;
  }
}

class Word {
  late final String word;
  Word(this.word);
}
