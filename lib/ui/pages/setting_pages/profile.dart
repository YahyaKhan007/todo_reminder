import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/pages/setting_pages/premium.dart';

import '../../screens/screens.dart';
import 'profile_photo.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var emailController = TextEditingController(text: "Yahya khan");
  var passController =
      TextEditingController(text: "Yahya.ali.barki@outlook.com");

  late FocusNode emailNode;
  late FocusNode passNode;
  @override
  void initState() {
    super.initState();
    emailNode = FocusNode();
    passNode = FocusNode();
  }

  @override
  void dispose() {
    emailNode.dispose();
    passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                size: 22.h,
              )),
          title: Text(
            "PROFILE",
            style: TextStyle(
                fontSize: 18.sp,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 700),
                                    type: PageTransitionType.fade,
                                    child: const BigProfile(),
                                    isIos: true));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  shape: BoxShape.circle),
                              child: Hero(
                                tag: "yahyaProfile",
                                child: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: const AssetImage(
                                    "assets/images/yahya.jpg",
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: InkWell(
                              onTap: () {
                                _edit(
                                  context,
                                  size,
                                );
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.sp),
                              )),
                        )
                      ],
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 30.h,
                              child: TextField(
                                // controller: emailController,
                                // focusNode: emailNode,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Yahya Khan",
                                  hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      // fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      letterSpacing: 0.3),
                                ),
                                style: TextStyle(
                                    fontSize: 16.sp, letterSpacing: 0.3),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // emailNode.requestFocus();
                            },
                            child: Icon(
                              Icons.edit,
                              size: 20.sp,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 20.h,
                              child: TextField(
                                // controller: passController,
                                // focusNode: passNode,
                                decoration: InputDecoration(
                                  hintText: "yahya.ali.barki@outlook.com",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3),
                                ),
                                style: TextStyle(
                                    fontSize: 17.sp, letterSpacing: 0.3),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () {
                              // passNode.requestFocus();
                            },
                            child: Icon(
                              Icons.edit,
                              size: 20.sp,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              "Free Account",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 14.sp),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            ProfileOption(
                text: "Upgrade to Premium",
                color: Colors.blue,
                ontap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(milliseconds: 700),
                          type: PageTransitionType.fade,
                          child: const Premium(),
                          isIos: true));
                }),
            ProfileOption(
                text: "Reset Password", color: Colors.black87, ontap: () {}),
            ProfileOption(
                text: "Delete Account",
                color: Colors.black87,
                ontap: () {
                  _task(
                      context,
                      size,
                      "REALLY?! ARE YOU SURE?",
                      "This action will permanantly delete all of your tasks and history. You can't undo this",
                      "CANCEL",
                      "DELETE",
                      () {},
                      () {});
                }),
            ProfileOption(
                text: "Restore Transactions",
                color: Colors.black87,
                ontap: () {}),
            ProfileOption(
                text: "Sign Out",
                color: Colors.black87,
                ontap: () {
                  _task(context, size, "SIGN OUT", "Sign out from  Any.do?",
                      "No", "Yes", () {}, () {});
                }),
          ],
        ),
      ),
    );
  }

  _edit(BuildContext context, Size size) {
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.h),
                            topRight: Radius.circular(10.h))),
                    child: Column(
                      children: [
                        EditOption(
                          color: Colors.blue,
                          index: 0,
                          txt: "EDIT PHOTO",
                          ontap: () {},
                        ),
                        EditOption(
                          color: Colors.grey.shade700,
                          index: 1,
                          txt: "Choose from Gallery",
                          ontap: () {},
                        ),
                        EditOption(
                          color: Colors.grey.shade700,
                          index: 2,
                          txt: "Take Photo",
                          ontap: () {},
                        ),
                        EditOption(
                          color: Colors.grey.shade700,
                          index: 3,
                          txt: "Remove Photo",
                          ontap: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.h),
                            bottomRight: Radius.circular(10.h))),
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  )
                ],
              ),
            ),
          );
        });
  }

  _task(
    BuildContext context,
    Size size,
    String title,
    String txt,
    String button1,
    String button2,
    VoidCallback onButton1,
    VoidCallback onButton2,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return Material(
          // color: Colors.white,
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp)),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text(
                          txt,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.grey.shade600,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(button1,
                                  style: TextStyle(
                                    letterSpacing: 0.4,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ))),
                          TextButton(
                              onPressed: () {},
                              child: Text(button2,
                                  style: TextStyle(
                                    letterSpacing: 0.4,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ))),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EditOption extends StatelessWidget {
  const EditOption(
      {Key? key,
      required this.color,
      required this.index,
      required this.txt,
      required this.ontap})
      : super(key: key);
  final VoidCallback ontap;
  final Color color;
  final int index;
  final String txt;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Text(txt,
            style: TextStyle(
              color: color,
              fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
              fontSize: 15.sp,
            )),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption(
      {Key? key, required this.text, required this.color, required this.ontap})
      : super(key: key);

  final String text;
  final Color color;

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 55.h,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Text(text, style: TextStyle(color: color, fontSize: 14.sp)),
      ),
    );
  }
}
