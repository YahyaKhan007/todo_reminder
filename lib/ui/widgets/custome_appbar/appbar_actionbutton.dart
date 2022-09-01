import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton1 extends StatelessWidget {
  const ActionButton1(
      {Key? key, required this.color, required this.ontap, required this.icon})
      : super(key: key);

  final Color color;
  final VoidCallback ontap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ontap,
        icon: Stack(
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 25.w,
            ),
            Positioned(
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: CircleAvatar(
                    radius: 7.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 4.r,
                      backgroundColor: Colors.red,
                    ),
                  ),
                )),
          ],
        ));
  }
}

class ActionButton2 extends StatelessWidget {
  const ActionButton2(
      {Key? key, required this.color, required this.ontap, required this.icon})
      : super(key: key);

  final Color? color;
  final VoidCallback ontap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Icon(
          icon,
          color: color,
          size: 25,
        ));
  }
}
