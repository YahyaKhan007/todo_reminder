// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/assetswidget.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({Key? key}) : super(key: key);

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        bottomOpacity: 80,
        shadowColor: Colors.grey.shade300,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
            color: Colors.grey.shade300,
            size: 25,
          ),
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: "  I want to...",
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          cursorColor: Colors.grey,
        ),
        actions: const [
          Icon(
            Icons.mic_none_sharp,
            size: 25,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              assets(text: "Call", icn: Icons.call),
              assets(text: "Check", icn: Icons.saved_search),
              assets(text: "Get", icn: Icons.clean_hands_outlined),
              assets(text: "Email", icn: Icons.email),
              assets(text: "Buy", icn: Icons.shopping_cart_outlined),
              assets(
                  text: "Meet/ Schedule", icn: Icons.calendar_month_outlined),
              assets(text: "Clean", icn: Icons.cleaning_services_outlined),
              assets(text: "Take", icn: Icons.grass_rounded),
              assets(text: "Send", icn: Icons.send),
              assets(text: "Pay", icn: Icons.payment),
              assets(text: "Make", icn: Icons.create_outlined),
              assets(
                  text: "pick", icn: Icons.playlist_add_check_circle_outlined),
              assets(text: "Do", icn: Icons.workspace_premium_outlined),
              assets(text: "Read", icn: Icons.book_outlined),
              assets(text: "Print", icn: Icons.print_outlined),
              assets(text: "Finish", icn: Icons.flag_outlined),
              assets(text: "Study", icn: Icons.hourglass_bottom),
              assets(text: "Ask", icn: Icons.question_mark_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
