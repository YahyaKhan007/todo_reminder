import 'package:flutter/material.dart';

import '../../../../screen_size.dart';
import '../text.dart';

class ListBox extends StatelessWidget {
  ListBox(
      {Key? key,
      required this.iconclr,
      required this.txt81,
      required this.txtsize})
      : super(key: key);
  final String txt81;
  final Color iconclr;
  final double txtsize;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      height: SH.fourty,
      color: Colors.white,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          text(
              txt: txt81,
              size: txtsize,
              clr: Colors.black,
              fw: FontWeight.w600),
          Icon(
            Icons.check,
            color: iconclr,
            size: SW.twennty,
          )
        ]),
      ),
    );
  }
}
