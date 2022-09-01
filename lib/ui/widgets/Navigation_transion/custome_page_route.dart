import 'package:flutter/material.dart';

class CustomePageRoute extends PageRouteBuilder {
  final Widget child;

  CustomePageRoute({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // ignore: todo
    // TODO: implement buildTransitions
    return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(animation),
        child: child);
  }
}
