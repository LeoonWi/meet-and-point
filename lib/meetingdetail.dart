import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:meet_and_point/friendslistmeeting.dart';
import 'package:meet_and_point/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MeetingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meeting Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF285BC0), // Добавляем фон
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // MapScreen at the top
              Container(
                width: 150,
                height: 150,
                child: MapScreen(
                  markerList: [],
                  indexFlag: 1,
                  allowOnTap: false,
                  initZoom: 20,
                )
              ),
              const SizedBox(height: 16),
              // Organizer name, address, date, and time
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Белый фон
                  borderRadius: BorderRadius.circular(8.0), // Опционально, добавляем скругления углов
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Organizer: John Doe',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Address: 123 Main Street, Cityville',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Date: 2023-12-15',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Time: 15:00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Button for the list of participants
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeetingParticipantsPage(),
                    ),
                  );
                },
                child: Text('Список участников'),
              ),
              const SizedBox(height: 16),
              // Remaining space for additional content
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}