import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/bottomsheet2/text.dart';

import '../../../../screen_size.dart';

class ConButton extends StatelessWidget {
  ConButton(
      {Key? key,
      required this.conclr,
      required this.txt51,
      required this.txtclr})
      : super(key: key);
  String txt51;
  Color conclr;
  Color txtclr;
  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      height: SH.thirty5,
      width: SW.one10,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: conclr),
      child: Center(
          child: text(
              txt: txt51, size: SW.twelve, clr: txtclr, fw: FontWeight.w500)),
    );
  }
}
