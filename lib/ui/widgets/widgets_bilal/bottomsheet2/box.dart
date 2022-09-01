import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/bottomsheet2/text.dart';

class Box extends StatelessWidget {
  Box({Key? key, required this.txr31, required this.icon}) : super(key: key);
  String txr31;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5),
      child: Container(
        height: size.height * 0.0460,
        width: size.width * 0.4328,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(3)),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0203),
            child: Icon(
              icon,
              size: size.width * 0.0305,
              color: Colors.grey.shade500,
            ),
          ),
          text(
              txt: txr31,
              size: size.width * 0.0305,
              clr: Colors.black,
              fw: FontWeight.normal)
        ]),
      ),
    );
  }
}
