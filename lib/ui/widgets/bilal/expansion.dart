// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/bilal/alltasksText.dart';

class CustomExpansiontTile extends StatelessWidget {
  CustomExpansiontTile({Key? key, required this.txt, this.txt2 = ""})
      : super(key: key);
  String txt;
  final String txt2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ExpansionTile(
      trailing: const Icon(
        Icons.add,
        color: Colors.blue,
      ),
      // title: alltaskstext(txt: txt),
      title: AllTasksText(txt: txt),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Stack(children: [
            Visibility(
              // visible: _isvisible,
              child: Positioned(
                  top: size.height * 0.017,
                  left: size.width * 0.065,
                  child: Container(
                    color: Colors.grey.shade400,
                    width: size.width - 100,
                    height: 1,
                  )),
            ),
            Row(children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  size: size.width * 0.05,
                  Icons.check_circle,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(
                width: size.width * 0.026,
              ),
              Text(
                txt2,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(
                Icons.cancel,
                size: size.width * 0.05,
                color: Colors.grey.shade400,
              ),
            ]),
          ]),
        )
      ],
    );
  }
}
