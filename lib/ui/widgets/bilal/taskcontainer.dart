// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  String txt;
  final IconData? icon;
  final Color color;
  final VoidCallback ontap;
  TaskContainer(
      {Key? key,
      required this.txt,
      this.icon,
      required this.ontap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: ontap,
      child: Container(
        width: size.width * 0.42,
        height: size.height * 0.10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.shade100,
                offset: const Offset(2, 2)),
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.shade100,
                offset: const Offset(-2, -2))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              txt,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
