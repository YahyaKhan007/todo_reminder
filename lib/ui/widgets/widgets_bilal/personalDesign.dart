import 'package:flutter/material.dart';

class design extends StatelessWidget {
  const design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.shade200,
                offset: Offset(4, 4)),
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.shade200,
                offset: Offset(-4, -4)),
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircleAvatar(
          radius: 9,
          backgroundColor: Colors.grey.shade200,
        ),
        Container(
            height: 15,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(50),
            ))
      ]),
    );
  }
}
