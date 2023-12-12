import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:meet_and_point/friendslistmeeting.dart';
import 'package:meet_and_point/map_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class createMeeting extends StatefulWidget {
  int idUser;
  List<LatLng> markerList;
  String userName;
  createMeeting({super.key, required this.idUser, required this.markerList, required this.userName});

  @override
  State<StatefulWidget> createState() => createMeetingPage();
}

class createMeetingPage extends State<createMeeting> {

  TextEditingController _nameMeeting = TextEditingController();
  DateTime now = DateTime.now();

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 350,
            child: Column(
              children: <Widget>[
                TableCalendar(
                    rowHeight: 40,
                    focusedDay: now,
                    firstDay: DateTime(2022,01,01),
                    lastDay: DateTime(2049,01,01)
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        print('Data received from modal: $value');
      }
    });
  }

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
          title: TextFormField(
            controller: _nameMeeting,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
            decoration: const InputDecoration(
              hintText: 'Введите название',
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              border: InputBorder.none,
              fillColor: const Color(0xFF102F6A),
              filled: true,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
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
                      markerList: widget.markerList,
                      initCenter: widget.markerList[0],
                      indexFlag: 1,
                      allowOnTap: false,
                      initZoom: 15,
                      idUser: widget.idUser,
                    )
                ),
                const SizedBox(height: 16),
                // Organizer name, address, date, and time
                Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xFF102F6A),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Colors.white,
                          width: 10
                      )
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Организатор: ${widget.userName}',
                        style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ш: ${widget.markerList[0].latitude}',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        'Д: ${widget.markerList[0].longitude}',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        'Дата: 2023-12-15',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        'Время: 15:00',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showModal();
                      },
                      child: const Text('Выбрать дату', style: TextStyle(color: Color(0xFF102F6A))),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(182, 44)
                      ),
                    ),
                    const SizedBox(height: 16),
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
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(182, 44)
                      ),
                    ),
                  ],
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