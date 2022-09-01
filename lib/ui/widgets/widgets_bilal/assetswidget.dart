import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class assets extends StatelessWidget {
  assets({Key? key, required this.text, required this.icn}) : super(key: key);
  String text;
  final IconData icn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icn,
            size: 18.sp,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 18.sp,
            ),
          )
        ],
      ),
    );
  }
}
