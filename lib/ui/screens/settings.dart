import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/setting_buttons_provider.dart';
import 'package:todo_reminder/ui/pages/pages.dart';
import 'package:todo_reminder/ui/screens/screens.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(
                letterSpacing: 0.5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Consumer<SettingButtonsProvider>(
            builder: (context, value, child) {
              return ListView(controller: controller, children: [
                Text("ACCOUNT",
                    style: TextStyle(letterSpacing: 0.3, fontSize: 14.sp)),
                SizedBox(
                  height: 25.h,
                ),
                Options(
                  txt: "Profile",
                  cont: false,
                  ic: false,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const Profile(),
                            isIos: true));
                  },
                ),
                Options(
                  ic: false,
                  txt: "Integrations",
                  cont: true,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const Integration(),
                            isIos: true));
                  },
                ),
                Options(
                  txt: "Premium",
                  cont: false,
                  buttonTxt: "7 DAYS Free Trial",
                  icon: const [CupertinoIcons.gift],
                  ic: false,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const Premium(),
                            isIos: true));
                  },
                ),
                Options(
                  txt: "Invite Friends",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Text("PREFRENCES",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14.sp)),
                ),
                Options(
                  txt: "Theme",
                  cont: false,
                  icon: const [
                    Icons.check,
                    CupertinoIcons.lock,
                    CupertinoIcons.lock,
                    CupertinoIcons.lock,
                    CupertinoIcons.lock,
                  ],
                  ic: true,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const Premium(),
                            isIos: true));
                  },
                ),
                Options(
                  txt: "Dynamic Theme",
                  cont: false,
                  ic: false,
                  buttonTxt: value.dynamicText,
                  isButton: value.dynamicTheme,
                  color:
                      value.dynamicTheme ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setDynamicButton(!value.dynamicTheme);
                  },
                ),
                Options(
                  txt: "Quick-add bar",
                  cont: false,
                  ic: false,
                  buttonTxt: value.quickAddText,
                  isButton: value.quickAdd,
                  color: value.quickAdd ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setQuickAdd(!value.quickAdd);
                  },
                ),
                Options(
                  txt: "Shake",
                  cont: false,
                  ic: false,
                  buttonTxt: value.shakeButtonText,
                  isButton: value.shakeButton,
                  color: value.shakeButton ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setShakeButton(!value.shakeButton);
                  },
                ),
                Options(
                  txt: "First day",
                  cont: false,
                  ic: false,
                  buttonTxt: "Sun",
                  color: Colors.blue,
                  ontap: () {},
                ),
                Options(
                  txt: "Default List",
                  cont: false,
                  ic: false,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const DefaultList(),
                            isIos: true));
                  },
                ),
                Options(
                  txt: "Language",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Options(
                  txt: "Notifcation Sound",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Options(
                  txt: "Smart grocery list",
                  cont: false,
                  ic: false,
                  buttonTxt: value.smartGrocerryText,
                  isButton: value.smartGrocerry,
                  color:
                      value.smartGrocerry ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setSmartGrocerry(!value.smartGrocerry);
                  },
                ),
                Options(
                  txt: "Time detection",
                  cont: false,
                  ic: false,
                  buttonTxt: value.timeDetectText,
                  isButton: value.timeDetect,
                  color: value.timeDetect ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setTimeDetectText(!value.timeDetect);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("TASKS",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14)),
                ),
                Options(
                  txt: "Any.do Moment",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Options(
                  txt: "Completed Tasks",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Options(
                  txt: "Color Tags",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("CALENDAR",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14)),
                ),
                Options(
                  txt: "Default calendar",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Options(
                  txt: "Event Reminder",
                  cont: false,
                  ic: false,
                  buttonTxt: value.eventRemindText,
                  isButton: value.eventRemind,
                  color: value.eventRemind ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setEventReminder(!value.eventRemind);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("WIDGET",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14)),
                ),
                Options(
                  txt: "Show completed tasks",
                  cont: false,
                  ic: false,
                  buttonTxt: value.compTaskText,
                  isButton: value.compTask,
                  color: value.compTask ? Colors.blue : Colors.grey.shade700,
                  ontap: () {
                    value.setComletedTask(!value.compTask);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("ANY.DO",
                      style: TextStyle(letterSpacing: 0.3, fontSize: 14)),
                ),
                Options(
                  txt: "Priority Support",
                  cont: false,
                  ic: false,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const Premium(),
                            isIos: true));
                  },
                ),
                Options(
                  txt: "Support",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
                Options(
                  txt: "Any.do Community",
                  cont: false,
                  ic: false,
                  ontap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: const Community(),
                            isIos: true));
                  },
                ),
                Options(
                  txt: "About",
                  cont: false,
                  ic: false,
                  ontap: () {},
                ),
              ]);
            },
          )),
    );
  }
}

class Options extends StatelessWidget {
  Options(
      {Key? key,
      required this.txt,
      required this.cont,
      this.icon,
      this.buttonTxt,
      required this.ic,
      this.color,
      required this.ontap,
      this.isButton})
      : super(key: key);
  final VoidCallback ontap;
  final String txt;
  final List<IconData>? icon;
  final String? buttonTxt;
  final bool cont;
  final bool ic;
  final Color? color;
  final bool? isButton;

  final List _color = <Color>[
    Colors.blue,
    Colors.black,
    Colors.pink,
    Colors.green,
    Colors.greenAccent,
  ];
  final List _iconColor = <Color>[
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(txt,
                style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 14.sp,
                    color: Colors.grey.shade700)),
            // **************************************************
            // for New red Container
            // **************************************************

            if (cont)
              Container(
                height: 22.h,
                width: 35.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
                child: Center(
                    child: Text(
                  "New",
                  style: TextStyle(color: Colors.white, fontSize: 8.sp),
                )),
              ),
            // **************************************************
            //   for icon and text  { 7 days free trial }
            // **************************************************

            if (buttonTxt != null && icon != null)
              Row(
                children: [
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      icon![0],
                      color: Colors.white,
                      size: 15.w,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(buttonTxt!,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 11.sp,
                      ))
                ],
              ),
            // **************************************************

            //  For Theme

            // **************************************************

            if (ic)
              Expanded(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: icon!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CircleAvatar(
                            radius: 13.r,
                            backgroundColor: _color[index],
                            child: Icon(
                              icon![index],
                              size: 15.w,
                              color: _iconColor[index],
                            ),
                          ),
                        );
                      })),

            // ***************************************

            //  for simple Text Button

            // ***************************************

            if (buttonTxt != null && icon == null)
              Text(
                buttonTxt!,
                style: TextStyle(
                    letterSpacing: 0.5, fontSize: 14.sp, color: color),
              )
          ],
        ),
      ),
    );
  }
}
