import 'package:flutter/material.dart';

class taskscontainer extends StatelessWidget {
  String txt;
  final IconData? icon;
  taskscontainer({Key? key, required this.txt, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 228,
      height: size.height * 0.10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.grey.shade100,
              offset: Offset(2, 2)),
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.grey.shade100,
              offset: Offset(-2, -2))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            txt,
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
