import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
          title: Text(
            "SUPPORT",
            style: TextStyle(
                fontSize: 19.sp,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SupportOption(
            icon: Icons.leave_bags_at_home,
            index: 0,
            txt: "FAQ",
            ontap: () {},
          ),
          SupportOption(
            icon: Icons.leave_bags_at_home,
            index: 1,
            txt: "REPORT A BUG",
            ontap: () {},
          ),
          SupportOption(
            icon: Icons.add,
            index: 2,
            txt: "SUGGEST A FEATURE",
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class SupportOption extends StatelessWidget {
  const SupportOption(
      {Key? key,
      required this.icon,
      required this.txt,
      required this.index,
      required this.ontap})
      : super(key: key);
  final VoidCallback ontap;
  final IconData icon;
  final String txt;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
        child: Container(
      width: size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 2)
              CircleAvatar(
                radius: 12.r,
                child: Icon(
                  icon,
                  size: 15.h,
                  color: Colors.white,
                ),
              )
            else if (index == 0 || index == 1)
              Icon(
                icon,
                color: Colors.blue,
                size: 25.h,
              ),
            SizedBox(
              height: 10.h,
            ),
            if (index != 100)
              Text(txt,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 20.sp,
                      letterSpacing: 0.5)),
            if (index == 100)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("I",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 20.sp,
                          letterSpacing: 0.5)),
                  const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.blue,
                  ),
                  Text("ANY.DO",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 20.sp,
                          letterSpacing: 0.5)),
                ],
              )
          ],
        ),
      ),
    ));
  }
}
