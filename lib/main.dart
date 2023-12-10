import 'package:flutter/material.dart';
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
      ),
      home: MeetingDetailsPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  List<LatLng> get _mapPoints => const [
    LatLng(55.755793, 37.617134),
    LatLng(55.095960, 38.765519),
    LatLng(56.129038, 40.406502),
    LatLng(54.513645, 36.261268),
    LatLng(54.193122, 37.617177),
    LatLng(54.629540, 39.741809),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapScreen(markerList: _mapPoints,),
    );
  }

}