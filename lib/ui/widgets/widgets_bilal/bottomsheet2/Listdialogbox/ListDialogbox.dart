import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/bottomsheet2/Listdialogbox/ListBox.dart';

class CustomListDialogbox extends StatelessWidget {
  const CustomListDialogbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      insetPadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListBox(
            txt81: "Select List",
            txtsize: 20.sp,
            iconclr: Colors.white,
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 4,
          ),
          ListBox(iconclr: Colors.blue, txt81: "Personal", txtsize: 15.sp),
          Divider(
            color: Colors.grey.shade100,
            thickness: 2.h,
          ),
          ListBox(iconclr: Colors.white, txt81: "Work", txtsize: 15.sp),
          Divider(
            color: Colors.grey.shade100,
            thickness: 2.h,
          ),
        ],
      ),
    );
  }
}
