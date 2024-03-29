// ignore_for_file: must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text.dart';

class box3 extends StatelessWidget {
  box3({Key? key, required this.txt41}) : super(key: key);
  String txt41;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DottedBorder(
      color: Colors.grey,
      dashPattern: const [1, 3],
      borderType: BorderType.RRect,
      radius: const Radius.circular(3),
      strokeWidth: 2,
      child: Container(
        height: size.height * 0.0395,
        width: size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
        child: Center(
            child: text(
                txt: txt41,
                size: 13.sp,
                clr: Colors.grey,
                fw: FontWeight.bold)),
      ),
    );
  }
}
