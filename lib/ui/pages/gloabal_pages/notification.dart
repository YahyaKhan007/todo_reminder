import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/data/anydo_tip.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool notify = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    )),
                Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                notify = false;
                              });
                            },
                            child: Text("ANY.DO TIPS",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notify
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade800))),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 3,
                          width: 80,
                          color: notify ? Colors.grey.shade300 : Colors.blue,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                notify = true;
                              });
                            },
                            child: Text("NOTIFICATIONS",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: notify
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade400,
                                ))),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 3,
                          width: 90,
                          color: notify ? Colors.blue : Colors.grey.shade300,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: (notify) ? const Notifications() : const Tips())
        ],
      ),
    );
  }
}

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: Tip.title.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TipContainer(
                buttonTxt: Tip.buttonTxt[index],
                title: Tip.title[index],
                subTitle: Tip.subtitle[index],
                onContainerCLick: () {},
                onDissmiss: () {},
              ),
            );
          }),
    );
  }
}

class TipContainer extends StatelessWidget {
  final VoidCallback onDissmiss;
  final VoidCallback onContainerCLick;

  final String buttonTxt;
  final String title;
  final String subTitle;

  const TipContainer(
      {Key? key,
      required this.buttonTxt,
      required this.title,
      required this.subTitle,
      required this.onDissmiss,
      required this.onContainerCLick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: [
          InkWell(
            onTap: onContainerCLick,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      "assets/images/Capture.PNG",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blueAccent.shade200, BlendMode.modulate)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: onContainerCLick,
                      child: Text(buttonTxt,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: onDissmiss,
                      child: Text("Dismiss",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Nothing new here",
              style: TextStyle(fontSize: 30, color: Colors.grey.shade400),
            )
          ],
        ),
      ),
    );
  }
}
