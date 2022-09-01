import 'package:flutter/material.dart';

class text extends StatelessWidget {
  text(
      {Key? key,
      required this.txt,
      required this.size,
      required this.clr,
      required this.fw})
      : super(key: key);
  String txt;
  double size;
  Color clr;
  FontWeight fw;

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: TextStyle(
          color: clr,
          fontSize: size,
          fontWeight: fw,
        ));
  }
}
