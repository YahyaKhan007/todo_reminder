import 'package:flutter/material.dart';

import 'bottomsheet2/text.dart';

class boxbutton extends StatelessWidget {
  boxbutton(
      {Key? key, required this.txt41, required this.clr, required this.icn})
      : super(key: key);
  String txt41;
  final IconData icn;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(color: Colors.grey.shade400),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icn,
            color: clr,
          ),
          SizedBox(
            width: 8,
          ),
          text(txt: txt41, size: 18, clr: clr, fw: FontWeight.w500),
        ],
      ),
    );
  }
}
