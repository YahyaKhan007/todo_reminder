import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class design extends StatelessWidget {
  const design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.sp,
      height: 40.sp,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.shade300,
                offset: const Offset(4, 4)),
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.shade300,
                offset: const Offset(-4, -4)),
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircleAvatar(
          radius: 9.r,
          backgroundColor: Colors.grey.shade300,
        ),
        Container(
            height: 15.sp,
            width: 140.sp,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
            ))
      ]),
    );
  }
}
