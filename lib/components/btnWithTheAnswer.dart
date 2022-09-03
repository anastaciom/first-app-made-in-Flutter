import 'package:flutter/material.dart';

class BtnWithTheAnswer extends StatelessWidget {
  final void Function({required String answer, required double grade})
      handleClick;
  final String text;
  final double grade;
  BtnWithTheAnswer(
      {required this.handleClick, required this.text, required this.grade});

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple[600]),
        onPressed: () => this.handleClick(answer: this.text, grade: this.grade),
        child: Text(this.text, style: TextStyle(fontSize: 16)));
  }
}
