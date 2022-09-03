import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String title;

  Result({this.title = 'Finish!! 🎉'});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color.fromARGB(255, 118, 0, 148)),
    );
  }
}
