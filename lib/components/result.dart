import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String title;
  final double total;
  final void Function() resetQuiz;
  Result(
      {this.title = 'Finish!! 🎉',
      required this.total,
      required this.resetQuiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Color.fromARGB(255, 118, 0, 148)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            'You scored ${this.total.round()} points',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        ElevatedButton(
          onPressed: this.resetQuiz,
          style: ElevatedButton.styleFrom(fixedSize: Size.fromWidth(150)),
          child: Row(
            children: [Icon(Icons.backspace_rounded), Text('Reset quiz')],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ],
    );
  }
}
