import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: bsideclr, width: 2),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
          child:
              text(txt: txt61, size: 12.sp, clr: txtclor, fw: FontWeight.w500)),
    );
  }
}
