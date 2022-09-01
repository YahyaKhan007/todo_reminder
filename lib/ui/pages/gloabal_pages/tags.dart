// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screen_size.dart';

bool isCheck = false;

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
// *****************************************************
//          For Premium User
// *****************************************************
  onTagClick(int index) {
    non_priority.add(priority[0]);
    non_priorityColor.add(priorityColor[0]);

    priorityColor.removeAt(0);
    priority.removeAt(0);

    priority.insert(0, non_priority[index]);
    priorityColor.insert(0, non_priorityColor[index]);

    non_priority.removeAt(index);
    non_priorityColor.removeAt(index);
  }

// *****************************************************
// *****************************************************

  List priority = ["Priority"];

  List priorityColor = [Colors.yellow];
  List<bool> con = List.generate(9, (index) => false);

  List non_priority = [
    "Important",
    "In Progress",
    "Deadline",
    "Family",
    "Trackback",
    "Science Project",
    "Work",
    "Not Critical",
    "Medium Priority"
  ];

  List non_priorityColor = [
    Colors.pink.shade300.withOpacity(0.6),
    Colors.pinkAccent.shade200.withOpacity(0.3),
    Colors.yellow.shade300.withOpacity(0.8),
    Colors.green.shade300.withOpacity(0.7),
    Colors.greenAccent.withOpacity(0.7),
    Colors.blueAccent.withOpacity(0.4),
    Colors.blue.shade300.withOpacity(0.5),
    Colors.purple.shade500.withOpacity(0.5),
    Colors.grey.shade500.withOpacity(0.9),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: SH.twenty2,
            )),
        title: Text(
          "TAGS",
          style: TextStyle(
              fontSize: SW.ninteen,
              letterSpacing: -0.5,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("Save",
                  style: TextStyle(
                    letterSpacing: 0.4,
                    color: Colors.blue.shade500,
                    fontWeight: FontWeight.bold,
                    fontSize: SW.sixteen,
                  ))),
        ],
      ),
      body: Column(
        children: [
          TagOption(
            color: priorityColor[0],
            ontap: () {},
            txt: priority[0],
            custom_switch: _switch(context, isCheck: true, ontap: () {
              setState(() {
                con[0] = !con[0];
              });
            }),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       primary: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: priority.length,
          //       itemBuilder: (context, index) {
          //         return TagOption(
          //           color: priorityColor[index],
          //           check: false,
          //           ontap: () {},
          //           txt: "Priority",
          //         );
          //       }),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: SW.twenty5, right: SW.ten),
                    child: Text(
                      "Upgrade to Any.do Premium for more tags & colors",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: SW.fifteen,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: SW.fifteen),
                      child: Container(
                          height: SH.thirty,
                          width: SW.twennty,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade500,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "Upgrade",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: SW.twelve),
                                ),
                              ))),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: non_priority.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TagOption(
                        color: non_priorityColor[index],
                        ontap: () {
                          setState(() {
                            con[index] = !con[index];
                            if (con[index] == true) {
                              onTagClick(index);
                              con[index] = !con[index];
                            }
                          });

                          // setState(() {});
                        },
                        txt: non_priority[index],
                        custom_switch:
                            _switch(context, isCheck: con[index], ontap: () {
                          setState(() {
                            con[index] = !con[index];
                          });
                        }));
                  }))
        ],
      ),
    );
  }

  Widget _switch(BuildContext context,
      {required bool isCheck, required VoidCallback ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: SH.fifteen,
        width: SW.fifteen,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white)),
        child: Icon(
          Icons.check,
          color: isCheck ? Colors.white : Colors.transparent,
          size: SH.ten,
        ),
      ),
    );
  }
}

class TagOption extends StatefulWidget {
  const TagOption(
      {Key? key,
      required this.ontap,
      required this.color,
      required this.txt,
      required this.custom_switch})
      : super(key: key);
  final Widget custom_switch;
  final VoidCallback ontap;
  final Color color;
  final String txt;

  @override
  State<TagOption> createState() => _TagOptionState();
}

class _TagOptionState extends State<TagOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SH.fifty,
      color: widget.color,
      child: ListTile(
        onTap: widget.ontap,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: SW.ten),
        leading: widget.custom_switch,
        title: Text(
          widget.txt,
          style: TextStyle(color: Colors.white, fontSize: SW.fifteen),
        ),
        trailing: IconButton(
            onPressed: widget.ontap,
            icon: Icon(
              CupertinoIcons.eyedropper,
              color: Colors.white,
              size: SH.twenty,
            )),
      ),
    );
  }
}
