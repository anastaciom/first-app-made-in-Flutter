import 'package:flutter/material.dart';

class BtnWithTheAnswer extends StatelessWidget {
  final void Function({required String answer}) handleClick;
  final String text;
  BtnWithTheAnswer({required this.handleClick, required this.text});

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple[600]),
        onPressed: () => this.handleClick(answer: this.text),
        child: Text(this.text, style: TextStyle(fontSize: 16)));
  }
}
