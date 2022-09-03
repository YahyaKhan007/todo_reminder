import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_reminder/provider/add_grocery_condition.dart';
import 'package:todo_reminder/provider/setting_buttons_provider.dart';
import 'package:todo_reminder/provider/tag_provider.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/pratice_screens/weekCal.dart';
import 'package:todo_reminder/ui/screens/home_page.dart';
import 'provider/calendar_provider.dart';

void main() {
  runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => CalendarProvider()),
        ListenableProvider(create: (_) => TaskProvider()),
        ListenableProvider(create: (_) => AddGrocerryProvider()),
        ListenableProvider(create: (_) => SettingButtonsProvider()),
        ListenableProvider(create: (_) => TagProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
