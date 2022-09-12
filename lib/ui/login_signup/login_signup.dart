// ignore_for_file: must_be_immutable, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/firebase_services/auth_login.dart';
import 'package:todo_reminder/provider/loading.dart';
import 'package:todo_reminder/ui/login_signup/animated.dart';
import 'package:todo_reminder/ui/screens/screens.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  String errorMessage = "";

  bool isLogin = true;
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

// **************************************

  final AuthLogin _auth = AuthLogin();

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 420.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/organise.jpeg",
                      ),
                      fit: BoxFit.contain)),
            ),
            buttonContainer(context,
                btnTxt: "Continue with Google",
                subText: "Secured Log-in",
                image: "assets/images/google.png",
                color: Colors.blueAccent.shade200,
                ontap: () {}),
            buttonContainer(context,
                btnTxt: "Continue with Facebook",
                subText: "We'll never post on your behalf",
                image: "assets/images/fb.jpg",
                color: Colors.blue.shade900.withOpacity(1),
                ontap: () {}),
            buttonContainer(context,
                btnTxt: "Continue with Email",
                // subText: "We'll never post on your behalf",
                // image: null,
                color: Colors.white, ontap: () async {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 700),
                      alignment: Alignment.center,
                      type: PageTransitionType.fade,
                      child: AnimatedListExample(),
                      isIos: true));
            }),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Why do I need to create an account",
                style: TextStyle(fontSize: 10.sp, color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "By Using Any.do accept Our Terms of Use and Privacy Policy",
                style: TextStyle(fontSize: 9.5.sp, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonContainer(BuildContext context,
      {var image, var btnTxt, String? subText, var color, var ontap}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: Container(
          height: 45.h,
          width: 270.w,
          decoration: BoxDecoration(
              border: Border.all(
                  color: color == Colors.white
                      ? Colors.grey.shade500
                      : Colors.white),
              color: color,
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: image != null
                      ? ClipOval(
                          child: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.email,
                          size: 20.sp,
                        )),
              Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        btnTxt,
                        style: TextStyle(
                            color: color == Colors.white
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      if (subText != null)
                        Text(
                          subText,
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.sp),
                        )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
