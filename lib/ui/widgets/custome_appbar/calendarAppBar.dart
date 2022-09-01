// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/pages/gloabal_pages/notification.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

import '../../screens/screens.dart';

class CalendarAppBar extends StatefulWidget {
  const CalendarAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        ActionButton1(
            color: Colors.grey,
            ontap: () {
              Navigator.of(context)
                  .push(CustomePageRoute(child: const NotificationPage()));
            },
            icon: Icons.check_box_outlined),
        SizedBox(
          width: 5.w,
        ),
        PopupMenuButton(
          icon: Icon(
            Icons.more_horiz,
            size: 25.h,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
                  .copyWith(topRight: const Radius.circular(0))),
          elevation: 5,
          // },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Moment',
                  child: PopUpItem(
                    color: Colors.green,
                    icon: CupertinoIcons.square_split_2x2_fill,
                    ontap: () {},
                    text: "Moment",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Settings',
                  child: PopUpItem(
                    color: Colors.black45,
                    icon: Icons.settings,
                    ontap: () {},
                    text: "Settings",
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: 'Upgrade',
                  child: PopUpItem(
                    color: Colors.yellow,
                    icon: Icons.shopping_basket_outlined,
                    ontap: () {},
                    text: "Upgrade",
                  )),
            ];
          },
        ),

        //     icon: Icons.do_disturb_on_sharp),
      ],
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black, fontSize: 15.sp),
      ),
      leadingWidth: 54.w,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.fitbit_rounded,
            size: 25.h,
            color: Colors.grey.shade600,
          ),
          onPressed: () {
            calScafoldKey.currentState?.openDrawer();
          },
        ),
      ),
    );
  }
}

class PopUpItem extends StatelessWidget {
  final VoidCallback ontap;
  final Color color;
  final IconData icon;
  final String text;
  final bool? isNew;
  const PopUpItem({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.text,
    this.isNew,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 17.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  text,
                  style:
                      TextStyle(color: Colors.grey.shade800, fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
