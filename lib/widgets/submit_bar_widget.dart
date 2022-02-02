// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle_game/models/word_model.dart';

class SubmitBarWidget extends StatelessWidget {
  const SubmitBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WordModel>(
      builder: (context, model, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftButton(model, context),
            submitButton(model, context),
            rigthButton(model, context),
          ],
        );
      },
    );
  }

  IconButton rigthButton(WordModel model, BuildContext context) {
    return IconButton(
      onPressed: () {
        if (model.totalLetter < 5 && model.totalWord < 6) {
          // klavye eklenecek
          Provider.of<WordModel>(context, listen: false).addLetter("W");
        }
      },
      icon: Icon(Icons.add_circle_outline_rounded),
      iconSize: 50,
      color: Colors.green,
    );
  }

  ElevatedButton submitButton(WordModel model, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (model.totalLetter == 5 && model.totalWord < 6) {
          // kelime için veritabanı kontrolü yapılacak
          Provider.of<WordModel>(context, listen: false).addWord(Word(model.letterList.join()));
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  IconButton leftButton(WordModel model, BuildContext context) {
    return IconButton(
      onPressed: () {
        if (model.totalLetter > 0 && model.totalWord < 6) {
          Provider.of<WordModel>(context, listen: false).deleteLetter();
        }
      },
      icon: Icon(Icons.lock),
      iconSize: 50,
      color: Colors.green,
    );
  }
}
