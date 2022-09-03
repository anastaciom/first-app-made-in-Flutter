import 'package:flutter/material.dart ';
import 'package:questions_app/components/btnWithTheAnswer.dart';
import 'package:questions_app/components/questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int whatQuestion;
  final void Function({required String answer, required double grade})
      handleClick;
  final bool selectedQuestion;

  Quiz(
      {required this.questions,
      required this.whatQuestion,
      required this.handleClick,
      required this.selectedQuestion});

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> allAnswers =
        selectedQuestion ? questions[whatQuestion].cast()['answers'] : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Question(
              text: questions[whatQuestion]['question'].toString(), size: 18),
        ),
        ...allAnswers
            .map((e) => BtnWithTheAnswer(
                  handleClick: handleClick,
                  text: e['text'].toString(),
                  grade: double.parse(e['grade'].toString()),
                ))
            .toList()
      ],
    );
  }
}
