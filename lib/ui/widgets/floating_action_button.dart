import 'package:flutter/material.dart';

class ActionFloatingButton extends StatelessWidget {
  const ActionFloatingButton(
      {Key? key,
      required this.radius,
      required this.ontap,
      required this.icon,
      required this.iconColor,
      required this.color})
      : super(key: key);
  final Color iconColor;
  final Color color;
  final double radius;
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
        child: Icon(
          icon,
          color: iconColor,
          size: radius,
        ),
      ),
    );
  }
}
