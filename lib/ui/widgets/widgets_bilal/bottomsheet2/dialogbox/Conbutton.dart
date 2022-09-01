import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      height: 35.h,
      width: 110.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: conclr),
      child: Center(
          child:
              text(txt: txt51, size: 12.sp, clr: txtclr, fw: FontWeight.w500)),
    );
  }
}
