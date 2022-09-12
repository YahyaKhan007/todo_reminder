import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    return Container(
      height: 40.h,
      color: Colors.white,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
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
            size: 20.h,
          )
        ]),
      ),
    );
  }
}
