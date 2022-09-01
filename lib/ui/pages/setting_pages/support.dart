import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/screen_size.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
          title: Text(
            "SUPPORT",
            style: TextStyle(
                fontSize: SW.ninteen,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SupportOption(
            icon: Icons.leave_bags_at_home,
            index: 0,
            txt: "FAQ",
            ontap: () {},
          ),
          SupportOption(
            icon: Icons.leave_bags_at_home,
            index: 1,
            txt: "REPORT A BUG",
            ontap: () {},
          ),
          SupportOption(
            icon: Icons.add,
            index: 2,
            txt: "SUGGEST A FEATURE",
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class SupportOption extends StatelessWidget {
  const SupportOption(
      {Key? key,
      required this.icon,
      required this.txt,
      required this.index,
      required this.ontap})
      : super(key: key);
  final VoidCallback ontap;
  final IconData icon;
  final String txt;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return Expanded(
        child: Container(
      width: size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 2)
              CircleAvatar(
                radius: SW.twelve,
                child: Icon(
                  icon,
                  size: SH.fifteen,
                  color: Colors.white,
                ),
              )
            else if (index == 0 || index == 1)
              Icon(
                icon,
                color: Colors.blue,
                size: SH.twentyFive,
              ),
            SizedBox(
              height: SH.ten,
            ),
            if (index != 100)
              Text(txt,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: SW.twennty,
                      letterSpacing: 0.5)),
            if (index == 100)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("I",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: SW.twennty,
                          letterSpacing: 0.5)),
                  const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.blue,
                  ),
                  Text("ANY.DO",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: SW.twennty,
                          letterSpacing: 0.5)),
                ],
              )
          ],
        ),
      ),
    ));
  }
}
