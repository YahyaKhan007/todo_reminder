import 'package:flutter/material.dart';

import '../../../../screen_size.dart';
import '../text.dart';
import 'BottomButton.dart';
import 'circlebutton.dart';

class CustomPageview1 extends StatelessWidget {
  const CustomPageview1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return SizedBox(
      //color: Colors.red,
      // width: size.width,
      height: SH.one65,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                circlebutton(
                    txt61: "Daily",
                    bsideclr: Colors.blue,
                    txtclor: Colors.blue),
                circlebutton(
                    txt61: "Weekly",
                    bsideclr: Colors.black,
                    txtclor: Colors.black),
                circlebutton(
                    txt61: "Monthly",
                    bsideclr: Colors.black,
                    txtclor: Colors.black),
                circlebutton(
                    txt61: "Yearly",
                    bsideclr: Colors.black,
                    txtclor: Colors.black),
              ],
            ),
          ),
          SizedBox(
            height: SH.thirty,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SW.thirty),
            child: Row(
              children: [
                text(
                    txt: "Start on",
                    size: SW.thirteen,
                    clr: Colors.black,
                    fw: FontWeight.bold),
                const Spacer(),
                text(
                    txt: "20 Aug 2021 10:49 pm",
                    size: SW.thirteen,
                    clr: Colors.blue,
                    fw: FontWeight.w600),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          BottomButton(
            txt71: "Cancle",
            txt72: "Set",
            txtclr: Colors.blue,
          ),
        ],
      ),
    );
  }
}
