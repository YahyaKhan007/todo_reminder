import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/pages/pages.dart';
import 'package:todo_reminder/ui/screen_size.dart';

class DefaultList extends StatelessWidget {
  const DefaultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SW.init(context: context);
    SH.init(context: context);
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
            "DEFAULT LIST",
            style: TextStyle(
                fontSize: SW.ninteen,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Column(
        children: [
          Option(txt: "Personal", ontap: () {}),
          Divider(
            color: Colors.grey.shade300,
            thickness: 0.8,
          ),
          Option(txt: "Work", ontap: () {})
        ],
      ),
    );
  }
}
