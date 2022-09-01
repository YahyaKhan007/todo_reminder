import 'package:flutter/material.dart';
import '../../../screen_size.dart';
import '../switchbutton.dart';
import 'dialogbox/Conbutton.dart';
import 'dialogbox/pageview.dart';
import 'dialogbox/pageview2.dart';
import 'dialogbox/pageview3.dart';
import 'text.dart';

class CustomDailogBox extends StatefulWidget {
  const CustomDailogBox({Key? key}) : super(key: key);

  @override
  State<CustomDailogBox> createState() => _CustomDailogBoxState();
}

class _CustomDailogBoxState extends State<CustomDailogBox> {
  int _check = 1;
  bool _changeclr = true;
  bool _changeclr2 = false;
  bool _changeclr3 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SW.init(context: context);
    SH.init(context: context);
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        insetPadding: EdgeInsets.all(SW.fifteen),
        contentPadding: EdgeInsets.symmetric(vertical: SH.ten),
        alignment: Alignment.topCenter,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: SH.fourty5,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade100, width: SW.five)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(
                          txt: "Add a reminder",
                          size: SW.eighteen,
                          clr: Colors.black,
                          fw: FontWeight.bold),
                      const CustomSwitch(),
                    ],
                  ),
                )),
            SizedBox(
              height: SH.twenty,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SW.fifteen),
              child: Container(
                height: SH.thirty5,
                // width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade300),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _check = 1;
                        _changeclr = true;
                        _changeclr2 = false;
                        _changeclr3 = false;
                      });
                    },
                    child: ConButton(
                        conclr: _changeclr ? Colors.black : Colors.transparent,
                        txt51: "One Time",
                        txtclr: _changeclr ? Colors.white : Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _check = 2;
                        _changeclr2 = true;
                        _changeclr = false;

                        _changeclr3 = false;
                      });
                    },
                    child: ConButton(
                        conclr: _changeclr2 ? Colors.black : Colors.transparent,
                        txt51: "Repeat",
                        txtclr: _changeclr2 ? Colors.white : Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _check = 3;
                        _changeclr3 = true;
                        _changeclr2 = false;
                        _changeclr = false;
                      });
                    },
                    child: ConButton(
                        conclr: _changeclr3 ? Colors.black : Colors.transparent,
                        txt51: "Location",
                        txtclr: _changeclr3 ? Colors.white : Colors.black),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: SH.fifteen,
            ),
            if (_check == 1) ...[
              const CustomPageview1(),
            ] else if (_check == 2) ...[
              const Pagview2(),
            ] else if (_check == 3) ...[
              const Pageview3(),
            ]
          ],
        ));
  }
}
