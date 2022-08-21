import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        child: Text(
                          questions[whatQuestion],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple[600]),
                          onPressed: () => handleClick(answer: 'answer 1'),
                          child: Text('Resposta 1',
                              style: TextStyle(fontSize: 16))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple[600]),
                          onPressed: () => handleClick(answer: 'answer 2'),
                          child: Text('Resposta 2',
                              style: TextStyle(fontSize: 16))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple[600]),
                          onPressed: () => handleClick(answer: 'answer 3'),
                          child: Text('Resposta 3',
                              style: TextStyle(fontSize: 16)))
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
