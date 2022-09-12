import 'package:flutter/material.dart';
import 'package:todo_reminder/firebase_services/auth_login.dart';
import 'package:todo_reminder/ui/login_signup/login_signup.dart';
import 'package:todo_reminder/ui/screens/screens.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthLogin().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginSignup();
        }
      },
    );
  }
}
