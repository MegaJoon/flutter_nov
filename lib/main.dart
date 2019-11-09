import 'package:flutter/material.dart';

import '1106/reminders_mobile_app.dart';
import '1107/instagram_app.dart';
import '1108/appointmentapp.dart';
import '1108/fitnessapp.dart';
import '1109/store_concept_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: RemindersMobileApp(),  // 11-06
//      home: InstagramApp(),  // 11-07
//      home: FitnessApp(),  // 11-08
//      home: AppointmentApp(),  // 11-08
      home: StoreConceptApp(),  // 11-09
  );
}
}