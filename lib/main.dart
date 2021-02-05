import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(new MaterialApp(
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Test Your Brain !",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.white10,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    quizBrain.getQuestions(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            flatButton(Colors.green, true, "TRUE"),
            flatButton(Colors.red, false, "FALSE"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                children: quizBrain.answerHistory(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget flatButton(Color buttonColor, bool userAnswer, String buttonName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: FlatButton(
          minWidth: 300,
          color: buttonColor,
          onPressed: () {
            setState(() {
              quizBrain.checkAnswer(userAnswer);
              if (quizBrain.quizFinished()) {
                Alert(
                        context: context,
                        title: "HURREY !",
                        desc: "You Finished The Quiz.")
                    .show();
              }
            });
          },
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
