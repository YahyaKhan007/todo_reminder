// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class AllTasksText extends StatelessWidget {
  AllTasksText({Key? key, required this.txt}) : super(key: key);
  String txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(
          fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
    );
  }
}
