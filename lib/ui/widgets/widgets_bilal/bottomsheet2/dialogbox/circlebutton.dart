import 'package:flutter/material.dart';

import '../../../../screen_size.dart';
import '../text.dart';

class circlebutton extends StatelessWidget {
  circlebutton(
      {Key? key,
      required this.txt61,
      required this.bsideclr,
      required this.txtclor})
      : super(key: key);
  String txt61;
  Color bsideclr;
  Color txtclor;

  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      height: SH.sixty5,
      width: SW.sixty5,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: bsideclr, width: 2),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
          child: text(
              txt: txt61, size: SW.twelve, clr: txtclor, fw: FontWeight.w500)),
    );
  }
}
