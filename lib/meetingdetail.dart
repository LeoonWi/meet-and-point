import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:meet_and_point/friendslistmeeting.dart';
import 'package:meet_and_point/map_screen.dart';

class MeetingDetail extends StatefulWidget {
  int id;
  int idUser;
  String username;
  String name;
  double latitude;
  double longitude;
  String date;

  MeetingDetail({
    super.key,
    required this.id,
    required this.idUser,
    required this.username,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.date,
  });

  @override
  State<MeetingDetail> createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<MeetingDetail> {
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
          title: Text(widget.name, textAlign: TextAlign.center, style: TextStyle(
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
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 10
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MapScreen(
                    markerList: [LatLng(widget.latitude, widget.longitude)],
                    indexFlag: 1,
                    initCenter: LatLng(widget.latitude, widget.longitude),
                    allowOnTap: false,
                    initZoom: 15,
                    idUser: widget.idUser,
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
                  child: Column(
                    children: [
                      Text(
                        'Организатор: ${widget.username}',
                        style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ш: ${widget.latitude}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Д: ${widget.longitude}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Дата: ${widget.date}',
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