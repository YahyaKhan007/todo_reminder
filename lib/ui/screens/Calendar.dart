// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:todo_reminder/ui/screens/screens.dart';
// import 'package:todo_reminder/ui/widgets/custome_appbar/calendarAppBar.dart';

// import '../widgets/widgets.dart';

// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({Key? key}) : super(key: key);

//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   bool showTableCalendar = false;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       key: calScafoldKey,
//       drawer: const CalendarDrawer(),
//       appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(53),
//           child: CalendarAppBar(title: "Calendar")),
//       body: SizedBox(
//         height: size.height,
//         width: size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   showTableCalendar = !showTableCalendar;
//                 });
//               },
//               child: Icon(
//                 showTableCalendar
//                     ? Icons.keyboard_arrow_up
//                     : Icons.keyboard_arrow_down,
//                 size: 17,
//               ),
//             ),
//             Visibility(
//                 visible: showTableCalendar,
//                 child: SizedBox(
//                   height: 200,
//                   child: TableCalendar(
//                     shouldFillViewport: true,
//                     calendarStyle: const CalendarStyle(
//                         // tableBorder: TableBorder.all(color: Colors.black)
//                         ),
//                     firstDay: DateTime.utc(2010, 10, 16),
//                     lastDay: DateTime.utc(2030, 3, 14),
//                     focusedDay: DateTime.now(),
//                     headerVisible: false,
//                   ),
//                 )),
//             SizedBox(
//               child: TableCalendar(
//                 // shouldFillViewport: true,
//                 calendarStyle: const CalendarStyle(
//                     // tableBorder: TableBorder.all(color: Colors.black)
//                     ),
//                 firstDay: DateTime.utc(2010, 10, 16),
//                 lastDay: DateTime.utc(2030, 3, 14),
//                 focusedDay: DateTime.now(),
//                 headerVisible: false,
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: ActionFloatingButton(
//         icon: Icons.add,
//         radius: 25,
//         color: Colors.blue,
//         iconColor: Colors.white,
//         ontap: () {
//           _showButtons(context);
//         },
//       ),
//     );
//   }


// }
