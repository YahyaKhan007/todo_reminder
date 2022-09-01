import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 25.h,
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
            size: 22.sp,
          ),
          SizedBox(
            width: 8.w,
          ),
          text(txt: txt41, size: 18.sp, clr: clr, fw: FontWeight.w500),
        ],
      ),
    );
  }
}
