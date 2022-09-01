// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        const SizedBox(
          width: 5,
        ),
        PopupMenuButton(
          icon: const Icon(
            Icons.more_horiz,
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
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
      leadingWidth: 54,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.fitbit_rounded,
            size: 25,
            color: Colors.grey.shade600,
          ),
          onPressed: () {
            calScafoldKey.currentState?.openDrawer();
          },
        ),
      ),
    );

    // appBar: AppBar(
    //   iconTheme: Theme.of(context).iconTheme,
    //   centerTitle: true,
    //   backgroundColor: Colors.transparent,
    //   elevation: 0,
    //   actions: [
    //     Button1(
    //       ontap: () {
    //         Navigator.of(context).push(CustomePageRoute(child: Check()));
    //       },
    //       icon: Icons.check_box_outlined,
    //       color: Colors.grey,
    //     ),
    //     SizedBox(
    //       width: 5,
    //     ),
    //     Button2(
    //       ontap: () {},
    //       icon: CupertinoIcons.circle,
    //       color: Colors.grey,
    //     )
    //   ],
    //   title: Text("All Task"),
    //   // title: ValueListenableBuilder(
    //   //   valueListenable: title,
    //   //   builder: (BuildContext context, String title, _) {
    //   //     return Text(
    //   //       title,
    //   //       style: const TextStyle(
    //   //           color: Colors.black,
    //   //           fontWeight: FontWeight.bold,
    //   //           fontSize: 16),
    //   //     );
    //   //   },
    //   // ),
    //   leadingWidth: 54,
    //   leading: Align(
    //     alignment: Alignment.centerRight,
    //     child: IconButton(
    //       icon: Icon(
    //         CupertinoIcons.circle_grid_3x3,
    //         size: 19,
    //         color: Colors.grey.shade600,
    //       ),
    //       onPressed: () {
    //         scafoldKey.currentState?.openDrawer();
    //       },
    //     ),
    //   ),
    // ),
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 17,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            // if (isNew != null)
            //   Container(
            //     margin: EdgeInsets.zero,
            //     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5), color: Colors.red),
            //     child: const Center(
            //         child: Text(
            //       "NEW",
            //       style: TextStyle(color: Colors.white, fontSize: 12),
            //     )),
            //   ),
          ],
        ),
      ),
    );
  }
}
