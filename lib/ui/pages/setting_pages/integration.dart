import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_reminder/ui/pages/pages.dart';
import 'package:todo_reminder/ui/widgets/Navigation_transion/custome_page_route.dart';

class Integration extends StatelessWidget {
  const Integration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                size: 25.sp,
              )),
          title: Text(
            "INTEGRATION",
            style: TextStyle(
                fontSize: 19.sp,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Column(
        children: [
          Option(
            txt: "+ 2000 Apps (Zapier)",
            ontap: () {
              Navigator.of(context)
                  .push(CustomePageRoute(child: const Premium()));
            },
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 0.8,
          ),
          Option(
            txt: "Whatsapp",
            ontap: () {
              Navigator.of(context)
                  .push(CustomePageRoute(child: const Premium()));
            },
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 0.8,
          ),
          Option(
            txt: "Connect to Amazon Alexa)",
            ontap: () {
              Navigator.of(context)
                  .push(CustomePageRoute(child: const Premium()));
            },
          )
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({Key? key, required this.txt, required this.ontap})
      : super(key: key);
  final String txt;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: 40.h,
        // decoration: BoxDecoration(
        //     border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Row(
          children: [
            Text(
              txt,
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 15.sp,
                  color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
