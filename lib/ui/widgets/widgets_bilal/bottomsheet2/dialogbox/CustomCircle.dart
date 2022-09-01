import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/bottomsheet2/text.dart';

import '../../../../screen_size.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({Key? key, required this.txt81, required this.icn})
      : super(key: key);
  final String txt81;
  final IconData icn;
  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      height: SH.eighty,
      width: SW.eighty,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.black87, width: 2),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icn,
            size: SH.twentyFive,
            color: Colors.black87,
          ),
          text(
              txt: txt81,
              size: SW.ten,
              clr: Colors.black87,
              fw: FontWeight.bold)
        ],
      ),
    );
  }
}
