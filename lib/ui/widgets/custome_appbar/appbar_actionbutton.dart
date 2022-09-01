import 'package:flutter/material.dart';

class ActionButton1 extends StatelessWidget {
  const ActionButton1(
      {Key? key, required this.color, required this.ontap, required this.icon})
      : super(key: key);

  final Color color;
  final VoidCallback ontap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ontap,
        icon: Stack(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            const Positioned(
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.red,
                    ),
                  ),
                )),
          ],
        ));
  }
}

class ActionButton2 extends StatelessWidget {
  const ActionButton2(
      {Key? key, required this.color, required this.ontap, required this.icon})
      : super(key: key);

  final Color? color;
  final VoidCallback ontap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Icon(
          icon,
          color: color,
          size: 25,
        ));
  }
}
