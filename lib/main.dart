import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_reminder/provider/add_grocery_condition.dart';
import 'package:todo_reminder/provider/loading.dart';
import 'package:todo_reminder/provider/setting_buttons_provider.dart';
import 'package:todo_reminder/provider/tag_provider.dart';
import 'package:todo_reminder/provider/task_provider.dart';
import 'package:todo_reminder/ui/login_signup/animated.dart';
import 'package:todo_reminder/ui/wrapper.dart';
import 'firebase_options.dart';
import 'provider/calendar_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ListenableProvider(create: (_) => Loading()),
        ListenableProvider(create: (_) => TagProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
