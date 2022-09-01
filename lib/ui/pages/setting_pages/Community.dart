// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/pages/setting_pages/support.dart';
import 'package:todo_reminder/ui/screen_size.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

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
            "COMMUNITY",
            style: TextStyle(
                fontSize: SW.ninteen,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )),
      body: Column(
        children: [
          SupportOption(
            icon: Icons.leave_bags_at_home,
            index: 100,
            txt: "i",
            ontap: () {},
          ),
          SupportOption(
            icon: Icons.diamond,
            index: 0,
            txt: "BE A SUPER USER",
            ontap: () {},
          ),
          SupportOption(
            icon: CupertinoIcons.globe,
            index: 0,
            txt: "HELP TRANSLATE ANY.DO",
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
