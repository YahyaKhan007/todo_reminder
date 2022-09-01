import 'package:flutter/material.dart';

class AddingButton extends StatelessWidget {
  const AddingButton({Key? key, required this.icn}) : super(key: key);
  final IconData icn;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.blue,
      child: Icon(icn),
    );
  }
}
