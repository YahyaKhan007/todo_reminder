import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text.dart';
import 'BottomButton.dart';

class Pageview3 extends StatelessWidget {
  const Pageview3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: 350,
      width: size.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 150.h,
            width: 250.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              // image:
              //     DecorationImage(image: AssetImage("assets/images/model.png")),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              "Get reminders where they matter the most",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 40.h,
            width: size.width - 80,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: text(
                    txt: "Upgrade To Premium",
                    size: 14.sp,
                    clr: Colors.white,
                    fw: FontWeight.bold)),
          ),
          SizedBox(
            height: 15.h,
          ),
          BottomButton(
              txt71: "Cancle", txtclr: Colors.grey.shade300, txt72: "Save")
        ],
      ),
    );
  }
}
