import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:meet_and_point/friendslistmeeting.dart';
import 'package:meet_and_point/map_screen.dart';

class MeetingDetail extends StatelessWidget {
  int? id;

  MeetingDetail({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF102F6A),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.white,
            iconSize: 35,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text('Название', textAlign: TextAlign.center, style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600
          )),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF285BC0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 10
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MapScreen(
                    markerList: [],
                    indexFlag: 1,
                    allowOnTap: false,
                    initZoom: 13,
                  )
                ),
                const SizedBox(height: 16),
                // Organizer name, address, date, and time
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF102F6A), // Белый фон
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 10
                    )
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: const Column(
                    children: [
                      Text(
                        'Organizer: John Doe',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Address: 123 Main Street, Cityville',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Date: 2023-12-15',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Time: 15:00',
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
                  child: const Text('Список участников', style: TextStyle(color: Color(0xFF102F6A))),
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
      ),
    );
  }
}