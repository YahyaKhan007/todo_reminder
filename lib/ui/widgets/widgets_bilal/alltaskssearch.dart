import 'package:flutter/material.dart';

class alltaskssearch extends StatelessWidget {
  alltaskssearch({Key? key, required this.txt}) : super(key: key);
  String txt;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.055,
      width: size.width - 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: const TextField(
        decoration: InputDecoration(
            labelText: "  I want to...", border: InputBorder.none),
      ),
    );
  }
}
