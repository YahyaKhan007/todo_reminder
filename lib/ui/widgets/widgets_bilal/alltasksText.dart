// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AllTasksText extends StatelessWidget {
  AllTasksText({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
    );
  }
}
