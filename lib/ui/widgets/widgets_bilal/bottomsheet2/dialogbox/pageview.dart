import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../screen_size.dart';
import '../text.dart';
import 'BottomButton.dart';
import 'circlebutton.dart';

class CustomPageview1 extends StatelessWidget {
  const CustomPageview1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      //color: Colors.red,
      // width: size.width,
      height: 165.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                circlebutton(
                    txt61: "Daily",
                    bsideclr: Colors.blue,
                    txtclor: Colors.blue),
                circlebutton(
                    txt61: "Weekly",
                    bsideclr: Colors.black,
                    txtclor: Colors.black),
                circlebutton(
                    txt61: "Monthly",
                    bsideclr: Colors.black,
                    txtclor: Colors.black),
                circlebutton(
                    txt61: "Yearly",
                    bsideclr: Colors.black,
                    txtclor: Colors.black),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                text(
                    txt: "Start on",
                    size: 13.sp,
                    clr: Colors.black,
                    fw: FontWeight.bold),
                const Spacer(),
                text(
                    txt: "20 Aug 2021 10:49 pm",
                    size: 13.sp,
                    clr: Colors.blue,
                    fw: FontWeight.w600),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          BottomButton(
            txt71: "Cancle",
            txt72: "Set",
            txtclr: Colors.blue,
          ),
        ],
      ),
    );
  }
}
