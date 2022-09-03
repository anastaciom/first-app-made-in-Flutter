import 'package:flutter/material.dart';
import 'package:questions_app/components/btnWithTheAnswer.dart';
import 'package:questions_app/components/quiz.dart';
import 'package:questions_app/components/result.dart';
import 'components/questions.dart';

void main() => runApp(QuestionApp());

class QuestionAppState extends State<QuestionApp> {
  int whatQuestion = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'question': 'Qual sua cor favorita?',
      'answers': ['Azul', 'Preto']
    },
    {
      'question': 'Qual sua linguagem de programação favorita?',
      'answers': ['Javascript', 'Dart']
    }
  ];

  bool get selectedQuestion {
    return whatQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    void handleClick({required String answer}) {
      print('was clicked on answer $answer');
      setState(() {
        whatQuestion++;
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
                ? Result()
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
