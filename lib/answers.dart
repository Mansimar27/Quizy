import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function appropriateAnswer;
  final String answerText;

  Answers(this.appropriateAnswer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: appropriateAnswer,
      color: Colors.blue,
      child: Text(answerText,
        style: TextStyle(
          color: Colors.white,
        ),),
    );
  }
}
