// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/edit_task_bottom_sheet.dart';

import 'alltasksText.dart';

class CostomExpTile extends StatefulWidget {
  const CostomExpTile({Key? key, required this.txt21, this.txt2 = ""})
      : super(key: key);
  final String txt21;
  final String txt2;
  @override
  State<CostomExpTile> createState() => _CostomExpTileState();
}

class _CostomExpTileState extends State<CostomExpTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ExpansionTile(
      trailing: Icon(
        Icons.add,
        size: 17.h,
        color: Colors.blue,
      ),
      title: AllTasksText(text: widget.txt21),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Stack(children: [
            Visibility(
              child: Positioned(
                  top: size.height * 0.014,
                  left: size.width * 0.065,
                  child: Container(
                    color: Colors.grey.shade400,
                    width: size.width - 100,
                    height: 1.h,
                  )),
            ),
            Row(children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  size: size.width * 0.05,
                  Icons.check_circle,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(
                width: size.width * 0.026,
              ),
              InkWell(
                onTap: () => _showbottomsheet2(context),
                child: Text(
                  widget.txt2,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.cancel,
                size: size.width * 0.05,
                color: Colors.grey.shade400,
              ),
            ]),
          ]),
        )
      ],
    );
  }

  void _showbottomsheet2(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        )),
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return EditTaskCustomBottomSheet();
          });
        });
  }
}
