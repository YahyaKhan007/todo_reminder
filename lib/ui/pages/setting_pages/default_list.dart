import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/pages/pages.dart';

class DefaultList extends StatelessWidget {
  const DefaultList({Key? key}) : super(key: key);

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
            "DEFAULT LIST",
            style: TextStyle(
                fontSize: 19.sp,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Column(
        children: [
          Option(txt: "Personal", ontap: () {}),
          Divider(
            color: Colors.grey.shade300,
            thickness: 0.8,
          ),
          Option(txt: "Work", ontap: () {})
        ],
      ),
    );
  }
}
