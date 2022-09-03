import 'package:flutter/material.dart';
import 'package:questions_app/components/btnWithTheAnswer.dart';
import 'package:questions_app/components/quiz.dart';
import 'package:questions_app/components/result.dart';
import 'components/questions.dart';

void main() => runApp(QuestionApp());

class QuestionAppState extends State<QuestionApp> {
  int whatQuestion = 0;
  double grades = 0;
  final List<Map<String, Object>> _questions = const [
    {
      'question': 'Qual sua cor favorita?',
      'answers': [
        {'text': 'Azul', 'grade': 9.5},
        {'text': 'Preto', 'grade': 4.5},
      ]
    },
    {
      'question': 'Qual sua linguagem de programação favorita?',
      'answers': [
        {'text': 'Javascript', 'grade': 2.0},
        {'text': 'Dart', 'grade': 5.5}
      ]
    }
  ];

  bool get selectedQuestion {
    return whatQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    void handleClick({required String answer, required double grade}) {
      grades += grade;
      setState(() {
        whatQuestion++;
      });
    }

    void handleResetQuiz() {
      setState(() {
        grades = 0;
        whatQuestion = 0;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Questions',
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !selectedQuestion
                ? Result(total: grades, resetQuiz: handleResetQuiz)
                : Quiz(
                    questions: _questions,
                    whatQuestion: whatQuestion,
                    handleClick: handleClick,
                    selectedQuestion: selectedQuestion)
          ],
        )),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  QuestionAppState createState() {
    return QuestionAppState();
  }
}
