import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text.dart';

class Attachmntbox extends StatelessWidget {
  const Attachmntbox({Key? key, required this.txt91, required this.iccon})
      : super(key: key);
  final String txt91;
  final IconData iccon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 45.h,
      width: size.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade100, width: 2.w))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Icon(
              iccon,
              color: Colors.grey.shade300,
              size: 22.h,
            ),
            SizedBox(
              width: 15.w,
            ),
            text(
                txt: txt91,
                size: 16.sp,
                clr: Colors.black54,
                fw: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
