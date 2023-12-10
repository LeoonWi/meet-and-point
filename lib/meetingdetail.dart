import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
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
                  markerList: const [
                    LatLng(55.755793, 37.617134),
                    LatLng(55.095960, 38.765519),
                    LatLng(56.129038, 40.406502),
                    LatLng(54.513645, 36.261268),
                    LatLng(54.193122, 37.617177),
                    LatLng(54.629540, 39.741809),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              // Button for the list of participants
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParticipantsListPage(),
                    ),
                  );
                },
                child: Text('Список участников'),
              ),
              SizedBox(height: 16),
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

class ParticipantsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Participants'),
      ),
      body: Center(
        child: Text('Participant 1\nParticipant 2\nParticipant 3\n'), // Add the actual list of participants here
      ),
    );
  }
}