import 'package:flutter/material.dart';

import '1106/reminders_mobile_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RemindersMobileApp(),
  );
}
}