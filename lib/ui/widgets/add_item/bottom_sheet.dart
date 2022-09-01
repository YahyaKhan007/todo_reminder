import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_reminder/ui/pages/gloabal_pages/Assetsscreen.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
      height: 60.h,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.shade400)),
      child: Row(children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20.w, right: 15.w),
              hintText: "I want to...",
              hintStyle:
                  TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade500),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(25),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(25),
              )),
        )),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: ActionFloatingButton(
            color: Colors.blue,
            iconColor: Colors.white,
            icon: Icons.add,
            radius: 20.r,
            ontap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.fade,
                      child: const AssetScreen()));
            },
          ),
        )
      ]),
    );
  }
}
