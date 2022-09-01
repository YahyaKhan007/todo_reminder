import 'package:flutter/material.dart';

class assets extends StatelessWidget {
  assets({Key? key, required this.text, required this.icn}) : super(key: key);
  String text;
  final IconData icn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icn,
            size: 18,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
