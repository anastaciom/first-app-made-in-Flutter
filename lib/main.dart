import 'package:flutter/material.dart';
import 'package:questions_app/components/btnWithTheAnswer.dart';
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

    List<String> allAnswers =
        selectedQuestion ? _questions[whatQuestion].cast()['answers'] : [];

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
                ? Text(
                    'Finish!! 🎉',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 118, 0, 148)),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Question(
                            text:
                                _questions[whatQuestion]['question'].toString(),
                            size: 18),
                      ),
                      ...allAnswers
                          .map((e) => BtnWithTheAnswer(
                              handleClick: handleClick, text: e))
                          .toList()
                    ],
                  )
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
