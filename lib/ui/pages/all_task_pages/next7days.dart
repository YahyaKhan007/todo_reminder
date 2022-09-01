import 'package:flutter/material.dart';
import 'package:todo_reminder/ui/screen_size.dart';
import 'package:todo_reminder/ui/widgets/widgets_bilal/expansiontile.dart';

class Next7Days extends StatefulWidget {
  const Next7Days({Key? key}) : super(key: key);

  @override
  State<Next7Days> createState() => _Next7DaysState();
}

class _Next7DaysState extends State<Next7Days> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height - 58,
              //color: Colors.red,
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                const CostomExpTile(
                  txt21: "Tuesday(Today)",
                  txt2: "Car",
                ),
                const CostomExpTile(txt21: "Wednesday"),
                const CostomExpTile(txt21: "Thursday"),
                const CostomExpTile(txt21: "Friday"),
                const CostomExpTile(txt21: "Saturday"),
                const CostomExpTile(txt21: "Sunday"),
                const CostomExpTile(txt21: "Monday"),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
