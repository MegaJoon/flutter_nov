import 'package:flutter/material.dart';
import 'package:flutter_nov/1118/flight_ticket_app.dart';
import 'package:flutter_nov/1119/control_scroll.dart';
import 'package:flutter_nov/1119/movie_app.dart';
import 'package:flutter_nov/1119/todo_app.dart';
import 'package:flutter_nov/1120/concept_medium.dart';
import 'package:flutter_nov/1120/fitness_companion_app.dart';
import 'package:flutter_nov/1121/custom_emoji_slider.dart';
import 'package:flutter_nov/1122/dark_mode_switch.dart';
import 'package:flutter_nov/1123/mcdonald_app.dart';
import 'package:flutter_nov/1125/subscription_view_app.dart';
import 'package:flutter_nov/1126/mbaiar_payment_app.dart';
import 'package:flutter_nov/1127/clothes_line_page.dart';

import '1106/reminders_mobile_app.dart';
import '1107/instagram_app.dart';
import '1108/appointmentapp.dart';
import '1108/fitnessapp.dart';
import '1109/store_concept_app.dart';
import '1110/custom_tabbar_example.dart';
import 'package:flutter_nov/1110/touch_event.dart';
import '1111/waffles.dart';
import '1112/travel_app.dart';
import 'package:flutter_nov/1112/travel_second_page.dart';
import '1113/second_travel_community_app.dart';
import '1113/travel_community_app.dart';
import '1115/yakuza.dart';
import 'package:flutter_nov/1116/delivery.dart';
import 'package:flutter_nov/1117/wines_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: RemindersMobileApp(),  // 11-06
//      home: InstagramApp(),  // 11-07
//      home: FitnessApp(),  // 11-08
//      home: AppointmentApp(),  // 11-08
//      home: StoreConceptApp(),  // 11-09
//      home: TouchEvent(),  // 11-10
//      home: CustomTabbarExample(),  // 11-10
//      home: WafflesApp(),  // 11-11
//      home: TravelApp(),  // 11-12
//      home: TravelCommunityApp(),  // 11-13
//      home: SecondTravelCommunityApp(),  // 11-13
//      home: YakuzaApp(),  // 11-15
//      home: DeliveryApp(),  // 11-16
//      home: FirebaseExample(),  // 11-17
//      home: PaymentApp(),  // 11-17
//      home: WinesApp(),  // 11-17
//      home: FlightTicketApp(),  // 11-18
//      home: TodoApp(),  // 11-19
//      home: ControlScroll(),  // 11-19
//      home: MovieApp(),  // 11-19
//      home: ConceptMedium(),  // 11-20
//      home: FitnessCompanionApp(),  // 11-20
//      home: CustomEmojiSliders(), // 11-21
//      home: DarkModeSwitch(), // 11-22
//      home: McDonaldApp(), // 11-23, 4
//      home: SubscriptionViewApp(), // 11-25
//      home: MbaiarPaymentApp(), // 11-26
      home: ClotheslinePage(), // 11-27
    );
  }
}
