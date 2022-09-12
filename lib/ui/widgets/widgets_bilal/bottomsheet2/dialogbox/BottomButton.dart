import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text.dart';

class BottomButton extends StatelessWidget {
  BottomButton(
      {Key? key, required this.txt71, this.txt72 = "", required this.txtclr})
      : super(key: key);
  final String txt71;
  final String txt72;
  final Color txtclr;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      height: 45.h,
      decoration: BoxDecoration(
        border:
            Border(top: BorderSide(color: Colors.grey.shade100, width: 5.w)),
        color: Colors.white,
      ),
      width: size.width,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 1.5),
              )),
              child: Center(
                child: text(
                    txt: txt71,
                    size: 15.sp,
                    clr: Colors.black,
                    fw: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: text(
                  txt: txt72, size: 15.sp, clr: txtclr, fw: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
