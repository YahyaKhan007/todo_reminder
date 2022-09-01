import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/pages/setting_pages/premium.dart';
import 'package:todo_reminder/ui/widgets/Navigation_transion/custome_page_route.dart';

import '../../screen_size.dart';
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
    SW.init(context: context);
    SH.init(context: context);

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
                size: SH.twenty2,
              )),
          title: Text(
            "PROFILE",
            style: TextStyle(
                fontSize: SW.eighteen,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Padding(
        padding: EdgeInsets.only(left: SW.fifteen, right: SW.five),
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
                                  radius: SW.thirty,
                                  backgroundImage: const AssetImage(
                                    "assets/images/yahya.jpg",
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SH.ten),
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
                                    color: Colors.grey, fontSize: SW.twelve),
                              )),
                        )
                      ],
                    )),
                SizedBox(
                  width: SW.ten,
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
                              height: SH.thirty,
                              child: TextField(
                                // controller: emailController,
                                // focusNode: emailNode,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Yahya Khan",
                                  hintStyle: TextStyle(
                                      fontSize: SW.fifteen,
                                      // fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      letterSpacing: 0.3),
                                ),
                                style: TextStyle(
                                    fontSize: SW.sixteen, letterSpacing: 0.3),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // emailNode.requestFocus();
                            },
                            child: Icon(
                              Icons.edit,
                              size: SH.twenty,
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
                              height: SH.twenty,
                              child: TextField(
                                // controller: passController,
                                // focusNode: passNode,
                                decoration: InputDecoration(
                                  hintText: "yahya.ali.barki@outlook.com",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: SW.fifteen,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3),
                                ),
                                style: TextStyle(
                                    fontSize: SW.seventeen, letterSpacing: 0.3),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SW.five,
                          ),
                          InkWell(
                            onTap: () {
                              // passNode.requestFocus();
                            },
                            child: Icon(
                              Icons.edit,
                              size: SH.twenty,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Free Account",
                              style: TextStyle(color: Colors.blue),
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
              padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SW.fifteen,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SW.ten),
                            topRight: Radius.circular(SW.ten))),
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
                    height: SH.fifty,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(SW.ten),
                            bottomRight: Radius.circular(SW.ten))),
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: SW.thirteen,
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
            padding: EdgeInsets.symmetric(horizontal: SW.twennty),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SW.fifteen,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(SW.ten)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SH.ten,
                      ),
                      Text(title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: SW.thirteen)),
                      Padding(
                        padding: EdgeInsets.only(top: SH.fifteen),
                        child: Text(
                          txt,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.grey.shade600,
                            fontSize: SW.thirteen,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SH.fifteen,
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
                                    fontSize: SW.thirteen,
                                  ))),
                          TextButton(
                              onPressed: () {},
                              child: Text(button2,
                                  style: TextStyle(
                                    letterSpacing: 0.4,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: SW.thirteen,
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
        padding:
            EdgeInsets.symmetric(horizontal: SW.fifteen, vertical: SH.fifteen),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Text(txt,
            style: TextStyle(
              color: color,
              fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
              fontSize: SW.fifteen,
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
        height: SH.fifty5,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child:
            Text(text, style: TextStyle(color: color, fontSize: SW.fourteen)),
      ),
    );
  }
}
