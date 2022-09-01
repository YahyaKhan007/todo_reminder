import 'package:flutter/material.dart';

import '../../../../screen_size.dart';
import '../text.dart';

class BottomButton extends StatelessWidget {
  BottomButton(
      {Key? key, required this.txt71, this.txt72 = "", required this.txtclr})
      : super(key: key);
  final String txt71;
  final String txt72;
  final Color txtclr;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return Container(
      alignment: Alignment.center,
      height: SH.fourty5,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.grey.shade100, width: SW.five)),
        color: Colors.white,
      ),
      width: size.width,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 1.5),
              )),
              child: Center(
                child: text(
                    txt: txt71,
                    size: SW.sixteen,
                    clr: Colors.black,
                    fw: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: text(
                  txt: txt72,
                  size: SW.sixteen,
                  clr: txtclr,
                  fw: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
