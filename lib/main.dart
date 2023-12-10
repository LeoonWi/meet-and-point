import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:meet_and_point/auth/registration.dart';
import 'package:meet_and_point/home.dart';
import 'package:meet_and_point/auth/login.dart';
import 'package:meet_and_point/auth/registration.dart';
import 'package:meet_and_point/configure.dart';
import 'package:meet_and_point/friends.dart';
import 'package:meet_and_point/friendslistmeeting.dart';
import 'package:meet_and_point/map_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:meet_and_point/meetingdetail.dart';
import 'package:meet_and_point/meetinglist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF285BC0),
      ),
      home: HomePage(),
      // const HomePage(),
    );
  }
}