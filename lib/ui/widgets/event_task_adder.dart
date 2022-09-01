import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_reminder/ui/pages/gloabal_pages/Assetsscreen.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

import 'floating_action_button.dart';

class EventOrTaskAdder extends StatelessWidget {
  const EventOrTaskAdder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showButtons(context);
  }

  static showButtons(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 75, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 300),
                                    type: PageTransitionType.fade,
                                    child: const AssetScreen()));
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Task",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ActionFloatingButton(
                            color: Colors.blue,
                            iconColor: Colors.white,
                            radius: 20,
                            icon: Icons.check_box,
                            ontap: () {})
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            // height: 35,
                            // width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Event",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w600),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        ActionFloatingButton(
                            color: Colors.blue,
                            iconColor: Colors.white,
                            radius: 25,
                            icon: Icons.calendar_month_outlined,
                            ontap: () {})
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}