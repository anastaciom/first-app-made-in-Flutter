import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;
  final double size;
  Question({this.text = '', this.size = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
    );
  }
}
