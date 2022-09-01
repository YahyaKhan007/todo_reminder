import 'package:flutter/material.dart';

import '../../../../screen_size.dart';
import '../text.dart';
import 'BottomButton.dart';

class Pageview3 extends StatelessWidget {
  const Pageview3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      // height: 350,
      width: size.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: SH.one50,
            width: SW.two50,
            decoration: const BoxDecoration(
              color: Colors.white,
              // image:
              //     DecorationImage(image: AssetImage("assets/images/model.png")),
            ),
          ),
          SizedBox(
            height: SH.twentyFive,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
            child: Text(
              "Get reminders where they matter the most",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SW.eighteen,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: SH.fifteen,
          ),
          Container(
            height: SH.fourty,
            width: size.width - 80,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: text(
                    txt: "Upgrade To Premium",
                    size: SW.fourteen,
                    clr: Colors.white,
                    fw: FontWeight.bold)),
          ),
          SizedBox(
            height: SH.fifteen,
          ),
          BottomButton(
              txt71: "Cancle", txtclr: Colors.grey.shade300, txt72: "Save")
        ],
      ),
    );
  }
}
