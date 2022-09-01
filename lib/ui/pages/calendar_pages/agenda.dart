// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Agenda extends StatefulWidget {
  Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  bool showTableCalendar = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showTableCalendar = !showTableCalendar;
                });
              },
              child: Icon(
                showTableCalendar
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 17,
              ),
            ),
            Visibility(
                visible: showTableCalendar,
                child: SizedBox(
                  height: 200,
                  child: TableCalendar(
                    shouldFillViewport: true,
                    calendarStyle: const CalendarStyle(
                        // tableBorder: TableBorder.all(color: Colors.black)
                        ),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    headerVisible: false,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
