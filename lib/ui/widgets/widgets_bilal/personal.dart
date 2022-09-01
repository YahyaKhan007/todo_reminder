import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/addingcircleavatar.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/alltaskssearch.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/personalDesign.dart';

import '../../pages/gloabal_pages/Assetsscreen.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Stack(children: [
              Column(
                children: [
                  const design(),
                  SizedBox(
                    height: 10.sp,
                  ),
                  const design(),
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Text(
                    ("No tasks here yet"),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ("Start adding task by tapping the '+' button"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        color: Colors.grey.shade400,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Positioned(
                  top: 30.sp,
                  right: 10.sp,
                  child: Container(
                    height: 60.sp,
                    width: 60.sp,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.grey.shade300,
                              offset: const Offset(4, 4)),
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.grey.shade200,
                              offset: const Offset(-4, -4)),
                        ]),
                    child: Icon(
                      Icons.add,
                      size: size.width * 0.09,
                      color: Colors.grey.shade300,
                    ),
                  )),
            ]),
          ),
          const Spacer(),
          Container(
            height: size.height * 0.075,
            width: size.width,
            color: Colors.grey.shade200,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  alltaskssearch(
                    txt: "I want to...",
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const AssetScreen();
                      }));
                    },
                    child: const AddingButton(
                      icn: Icons.add,
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
