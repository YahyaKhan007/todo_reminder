// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../screen_size.dart';

class Popmenu extends StatelessWidget {
  Popmenu({Key? key, required this.txt}) : super(key: key);
  String txt;

  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);
    return Text(
      txt,
      style: TextStyle(color: Colors.black, fontSize: SW.fourteen),
    );
  }
}
