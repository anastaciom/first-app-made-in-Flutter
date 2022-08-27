import 'package:flutter/material.dart';
import 'package:questions_app/components/btnWithTheAnswer.dart';
import 'components/questions.dart';

void main() => runApp(QuestionApp());

class QuestionAppState extends State<QuestionApp> {
  int whatQuestion = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'Qual sua cor favorita?',
      'Qual dessas não é uma linguagem de programação?',
    ];
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
            whatQuestion == questions.length
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
                        child:
                            Question(text: questions[whatQuestion], size: 18),
                      ),
                      BtnWithTheAnswer(
                          text: 'resposta 1', handleClick: handleClick),
                      BtnWithTheAnswer(
                          text: 'resposta 2', handleClick: handleClick),
                      BtnWithTheAnswer(
                          text: 'resposta 3', handleClick: handleClick),
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
