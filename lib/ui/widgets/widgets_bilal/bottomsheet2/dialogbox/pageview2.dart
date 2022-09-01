import 'package:flutter/material.dart';

import '../../../../screen_size.dart';
import 'BottomButton.dart';
import 'CustomCircle.dart';

class Pagview2 extends StatelessWidget {
  const Pagview2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      // height: 235,
      width: size.width,
      color: Colors.white,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomCircle(
                txt81: "Tomorrow",
                icn: Icons.access_alarm,
              ),
              CustomCircle(
                txt81: "Next Week",
                icn: Icons.g_mobiledata_sharp,
              ),
              CustomCircle(txt81: "Someday", icn: Icons.hail),
            ],
          ),
        ),
        SizedBox(
          height: SH.fifteen,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomCircle(
                txt81: "Custom",
                icn: Icons.calendar_month,
              ),
              CustomCircle(
                txt81: "Morning",
                icn: Icons.hiking,
              ),
              CustomCircle(
                txt81: "Today",
                icn: Icons.face_retouching_off,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SH.fifteen,
        ),
        BottomButton(
          txt71: "Cancle",
          txt72: "Save",
          txtclr: Colors.grey.shade300,
        ),
      ]),
    );
  }
}
