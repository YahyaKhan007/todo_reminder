// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/switchbutton.dart';

import '../../screen_size.dart';
import 'bottomsheet2/Attachmentbottomsheet/AttachmntSheet.dart';
import 'bottomsheet2/Box3.dart';
import 'bottomsheet2/Listdialogbox/ListDialogbox.dart';
import 'bottomsheet2/box.dart';
import 'bottomsheet2/dialog.dart';
import 'bottomsheet2/text.dart';
import 'boxbutton.dart';
import 'listview.dart';

class EditTaskCustomBottomSheet extends StatefulWidget {
  const EditTaskCustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<EditTaskCustomBottomSheet> createState() =>
      _EditTaskCustomBottomSheetState();
}

class _EditTaskCustomBottomSheetState extends State<EditTaskCustomBottomSheet> {
  bool _isvisible = true;
  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);

    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: -SH.fifteen,
            child: Container(
              width: SW.fifty,
              height: SH.six,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            )),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height * 0.0131,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: size.height * 0.0592,
              width: size.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0509),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.2346,
                      height: size.height * 0.0302,
                      decoration: BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                        bottom: BorderSide(color: Colors.blue, width: SW.three),
                      )),
                      child: Center(
                          child: text(
                              txt: "TASK DETAILS",
                              size: size.width * 0.027,
                              clr: Colors.black,
                              fw: FontWeight.w500)),
                    ),
                    InkWell(
                      onTap: () {
                        print(size.width);
                      },
                      child: text(
                          txt: "Save",
                          size: size.width * 0.0409,
                          clr: Colors.blue,
                          fw: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.7638,
              width: size.width,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SW.twennty),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.0197,
                        ),
                        text(
                            txt: "#Email",
                            size: size.width * 0.07338,
                            clr: Colors.black,
                            fw: FontWeight.bold),
                        SizedBox(
                          height: size.height * 0.0131,
                        ),
                        const CustomListView(),
                        SizedBox(
                          height: size.height * 0.0181,
                        ),
                        Row(
                          children: [
                            text(
                                txt: "REMIND ME ABOUT THIS",
                                size: size.width * 0.0305,
                                clr: Colors.black,
                                fw: FontWeight.normal),
                            const Spacer(),
                            Visibility(
                              visible: !_isvisible,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isvisible = true;
                                  });
                                },
                                child: text(
                                    txt: "REMOVE",
                                    size: size.width * 0.0305,
                                    clr: Colors.black,
                                    fw: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.0111,
                        ),

                        _isvisible
                            ? Wrap(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _showdillog(context);
                                    },
                                    child: Box(
                                        txr31: "Set time",
                                        icon: Icons.calendar_month),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isvisible = false;
                                      });
                                    },
                                    child: Box(
                                        txr31: "Tomorrow, 9:00 AM",
                                        icon: Icons.edit_calendar),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.0131,
                                  ),
                                  Box(
                                      txr31: "Daily,  weekly,  etc...",
                                      icon: Icons.refresh_outlined),
                                  Box(
                                      txr31: "At a location",
                                      icon: Icons.location_on),
                                ],
                              )
                            : Container(
                                width: size.width,
                                height: SH.fifty,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 238, 233, 233),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        text(
                                            txt: "Tomorrow at 09:00 AM",
                                            size: SW.fifteen,
                                            clr: Colors.blue,
                                            fw: FontWeight.w500),
                                        const CustomSwitch(),
                                      ]),
                                ),
                              ),
                        ///////
                        ///

                        SizedBox(
                          height: size.height * 0.0197,
                        ),

                        text(
                            txt: "LIST",
                            size: size.width * 0.0331,
                            clr: Colors.black,
                            fw: FontWeight.normal),
                        SizedBox(
                          height: size.height * 0.0197,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setstate) {
                                    return const CustomListDialogbox();
                                  });
                                });
                          },
                          child: Container(
                            height: size.height * 0.0460,
                            width: size.width * 0.432,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  text(
                                      txt: "Person",
                                      size: size.width * 0.0356,
                                      clr: Colors.black,
                                      fw: FontWeight.normal),
                                  SizedBox(
                                    height: size.height * 0.3951,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey.shade500,
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.0171,
                        ),
                        text(
                            txt: "SUBTASKS",
                            size: size.width * 0.0381,
                            clr: Colors.black,
                            fw: FontWeight.normal),
                        SizedBox(
                          height: size.height * 0.0197,
                        ),
                        Container(
                          height: size.height * 0.05268,
                          width: size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.0254),
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Add a new subtask",
                                      hintStyle: TextStyle(
                                          fontSize: size.width * 0.0407,
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.w500),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.0171,
                        ),
                        text(
                            txt: "NOTES",
                            size: size.width * 0.0381,
                            clr: Colors.black,
                            fw: FontWeight.normal),
                        SizedBox(
                          height: size.height * 0.0197,
                        ),
                        InkWell(
                            onTap: () {
                              // addNote(context);
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                              // ******
                            },
                            child: box3(txt41: "Tap to add notes")),
                        SizedBox(
                          height: size.height * 0.0171,
                        ),
                        text(
                            txt: "ATTACHMENTD",
                            size: size.width * 0.0331,
                            clr: Colors.black,
                            fw: FontWeight.normal),
                        SizedBox(
                          height: size.height * 0.0197,
                        ),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(0.0),
                                  )),
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return const AttachmntSheet();
                                    });
                                  });
                            },
                            child: box3(txt41: "Tap to add files")),
                        SizedBox(
                          height: size.height * 0.0197,
                        ),
                        text(
                            txt: "CREATED",
                            size: size.width * 0.0331,
                            clr: Colors.black,
                            fw: FontWeight.normal),
                        SizedBox(
                          height: size.height * 0.0263,
                        ),
                        text(
                            txt: "16 Aug 2022",
                            size: size.width * 0.0381,
                            clr: Colors.black,
                            fw: FontWeight.bold),
                        SizedBox(
                          height: size.height * 0.0263,
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.0526,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Center(
                            child: text(
                                txt: "Delete task",
                                size: size.width * 0.0381,
                                clr: Colors.red,
                                fw: FontWeight.w500),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.0263,
            ),
            Container(
              height: size.height * 0.0526,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top:
                        BorderSide(color: Colors.grey.shade100, width: SW.five),
                  )),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: boxbutton(
                        txt41: "Focus",
                        icn: Icons.face,
                        clr: Colors.black,
                      )),
                  Expanded(
                      flex: 1,
                      child: boxbutton(
                          txt41: "Done", clr: Colors.blue, icn: Icons.check)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  _showdillog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setstate) {
            return const CustomDailogBox();
          });
        });
  }
}
