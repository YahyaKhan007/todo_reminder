import 'package:flutter/material.dart';

import '../text.dart';

class Attachmntbox extends StatelessWidget {
  const Attachmntbox({Key? key, required this.txt91, required this.iccon})
      : super(key: key);
  final String txt91;
  final IconData iccon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 45,
      width: size.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade100, width: 2))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              iccon,
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              width: 15,
            ),
            text(txt: txt91, size: 16, clr: Colors.black54, fw: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
