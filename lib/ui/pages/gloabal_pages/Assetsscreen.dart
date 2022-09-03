// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/assetswidget.dart';

import '../../pratice_screens/weekCal.dart';
import '../../widgets/widgets_bilal/bottomsheet2/Box3.dart';
import '../../widgets/widgets_bilal/bottomsheet2/Listdialogbox/ListDialogbox.dart';
import '../../widgets/widgets_bilal/bottomsheet2/box.dart';
import '../../widgets/widgets_bilal/bottomsheet2/text.dart';
import '../../widgets/widgets_bilal/listview.dart';
import '../../widgets/widgets_bilal/switchbutton.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({Key? key}) : super(key: key);

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        bottomOpacity: 80,
        shadowColor: Colors.grey.shade100,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
            color: Colors.grey.shade400,
            size: 22.sp,
          ),
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "  I want to...",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            border: InputBorder.none,
          ),
          cursorColor: Colors.grey,
        ),
        actions: [
          Icon(
            Icons.mic_none_sharp,
            size: 22.sp,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    _showbottomsheet2(context);
                  },
                  child: assets(text: "Call", icn: Icons.call)),
              assets(text: "Check", icn: Icons.saved_search),
              assets(text: "Get", icn: Icons.clean_hands_outlined),
              assets(text: "Email", icn: Icons.email),
              assets(text: "Buy", icn: Icons.shopping_cart_outlined),
              assets(
                  text: "Meet/ Schedule", icn: Icons.calendar_month_outlined),
              assets(text: "Clean", icn: Icons.cleaning_services_outlined),
              assets(text: "Take", icn: Icons.grass_rounded),
              assets(text: "Send", icn: Icons.send),
              assets(text: "Pay", icn: Icons.payment),
              assets(text: "Make", icn: Icons.create_outlined),
              assets(
                  text: "pick", icn: Icons.playlist_add_check_circle_outlined),
              assets(text: "Do", icn: Icons.workspace_premium_outlined),
              assets(text: "Read", icn: Icons.book_outlined),
              assets(text: "Print", icn: Icons.print_outlined),
              assets(text: "Finish", icn: Icons.flag_outlined),
              assets(text: "Study", icn: Icons.hourglass_bottom),
              assets(text: "Ask", icn: Icons.question_mark_rounded),
            ],
          ),
        ),
      ),
    );
  }

  void _showbottomsheet2(BuildContext context) {
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
            return const EditTask();
          });
        });
  }
}

class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  bool _isvisible = false;
  final bool _addNote = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
                child: Text("Save", style: TextStyle(fontSize: 15.sp)),
                onPressed: () {
                  Navigator.of(context).pop();
                  getDataSource();
                }),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                  txt: "Call",
                  size: 20.sp,
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
                      size: 11.sp,
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
                          size: 11.sp,
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
                            // _showdillog(context);
                          },
                          child: Box(
                              txr31: "Set time", icon: Icons.calendar_month),
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
                        Box(txr31: "At a location", icon: Icons.location_on),
                      ],
                    )
                  : Container(
                      width: size.width,
                      height: 35.h,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 233, 233),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text(
                                  txt: "Tomorrow at 09:00 AM",
                                  size: 15.sp,
                                  clr: Colors.blue,
                                  fw: FontWeight.normal),
                              const CustomSwitch(),
                            ]),
                      ),
                    ),
              SizedBox(
                height: size.height * 0.0197,
              ),
              text(
                  txt: "LIST",
                  size: 13.sp,
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
                            (BuildContext context, StateSetter setstate) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        text(
                            txt: "Person",
                            size: 14.sp,
                            clr: Colors.black,
                            fw: FontWeight.normal),
                        SizedBox(
                          height: size.height * 0.3951,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey.shade500,
                          size: 20.h,
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: size.height * 0.0171,
              ),
              text(
                  txt: "SUBTASKS",
                  size: 13.sp,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.0254),
                      child: Icon(
                        Icons.circle,
                        color: Colors.grey.shade300,
                        size: 20.h,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Add a new subtask",
                            hintStyle: TextStyle(
                                fontSize: 15.sp,
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
                  size: 13.sp,
                  clr: Colors.black,
                  fw: FontWeight.normal),
              SizedBox(
                height: size.height * 0.0197,
              ),
              InkWell(onTap: () {}, child: box3(txt41: "Tap to add notes")),
              SizedBox(
                height: size.height * 0.0171,
              ),
              (_addNote != true)
                  ? SizedBox(
                      height: 80.h,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
