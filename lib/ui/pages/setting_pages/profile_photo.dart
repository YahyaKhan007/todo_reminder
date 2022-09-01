import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/widgets/widgets.dart';

class BigProfile extends StatelessWidget {
  const BigProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ActionFloatingButton(
                radius: 15,
                ontap: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                color: Colors.black),
          ),
          SizedBox(
            height: size.height / 5,
          ),
          SizedBox(
            height: size.height / 2,
            width: size.width,
            child: Hero(
                transitionOnUserGestures: true,
                tag: "yahyaProfile",
                child: Image.asset(
                  "assets/images/yahya.jpg",
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }
}
