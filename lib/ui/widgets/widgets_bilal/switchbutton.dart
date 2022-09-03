import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeIcon: const Icon(
        Icons.safety_check_rounded,
        color: Colors.blue,
      ),
      inactiveIcon: Icon(
        Icons.safety_check_rounded,
        color: Colors.grey.shade300,
      ),
      inactiveText: "",
      activeText: "",
      inactiveColor: Colors.grey.shade600,
      width: 50.0.w,
      height: 24.0.h,
      toggleSize: 28.0.h,
      value: status,
      borderRadius: 30.0.h,
      padding: 0.0.w,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          status = val;
        });
      },
    );
  }
}
