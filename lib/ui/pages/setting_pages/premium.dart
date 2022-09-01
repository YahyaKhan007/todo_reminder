import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/widgets/floating_action_button.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  List<String> labels = [
    "Recuring Tasks",
    "Customized themes",
    "WhatsApp Reminders",
    "Color tags and labels",
    "Location Reminder",
    "Unlimited Daily Planner"
  ];
  List<String> icons = [
    "assets/icons/1.png",
    "assets/icons/2.png",
    "assets/icons/3.png",
    "assets/icons/4.png",
    "assets/icons/5.png",
    "assets/icons/6.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            ActionFloatingButton(
                color: Colors.grey.shade400,
                iconColor: Colors.grey.shade900,
                radius: 13.r,
                ontap: () {
                  Navigator.of(context).pop();
                },
                icon: CupertinoIcons.xmark),
            Center(
              child: Text(
                "Double your productivity with",
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            ),
            Center(
              child: Text(
                "Any.do Premium",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.27,
              child: GridView.builder(
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.grey,
                    child:
                        item(context, size, icons[index], labels[index], () {}),
                  );
                },
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // mainAxisExtent: size.height * 0.12025,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.020),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  star(context),
                  star(context),
                  star(context),
                  star(context),
                  star(context),
                ],
              ),
            ),
            SizedBox(
                height: 150.h,
                width: size.width,
                child: CarouselSlider(
                    items: [
                      Column(
                        children: [
                          Text(
                              '"Sharing my tasks with my hubby like a boss. Loving Any.do Premium\n(",")"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.italic)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text("Christian Harris, Chicago",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                    options: CarouselOptions(
                      height: 120.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ))),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              height: 55.h,
              width: size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 21, 118, 197),
                  borderRadius: BorderRadius.circular(50.h)),
              child: Center(
                child: Text(
                  "Continue..",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  "Billed annually. Cancel Anytime.",
                  style:
                      TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget star(BuildContext context) {
    return Icon(
      Icons.star,
      size: 25.sp,
      color: Colors.yellow,
    );
  }

  Widget item(
      BuildContext context, size, var image, String txt, VoidCallback ontap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage(image),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 10.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
