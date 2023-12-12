import 'package:flutter/material.dart';
import 'package:meet_and_point/meetingdetail.dart';

class Meeting {
  final String title;
  final String place;
  final String date;
  final String time;

  Meeting({
    required this.title,
    required this.place,
    required this.date,
    required this.time,
  });
}

class MeetingListPage extends StatelessWidget {
  final List<Meeting> meetings = [
    Meeting(
      title: 'Team Meeting',
      place: 'Conference Room',
      date: '2023-12-15',
      time: '15:00',
    ),
    Meeting(
      title: 'Project Kick-off',
      place: 'Office Lobby',
      date: '2023-12-18',
      time: '10:30',
    ),
  ];

  MeetingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF285BC0),
      ),
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
          title: const Text('Встречи', textAlign: TextAlign.center, style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              meetings.isEmpty
                  ? Center(
                child: Text(
                  'Нет встреч',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: meetings.length,
                  itemBuilder: (context, index) {
                    return MeetingListItem(
                      meeting: meetings[index],
                      onGPS: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeetingListItem extends StatelessWidget {
  final Meeting meeting;
  final VoidCallback onGPS;

  const MeetingListItem({
    Key? key,
    required this.meeting,
    required this.onGPS,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF102F6A),
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          meeting.title,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Место: ${meeting.place}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              'Дата: ${meeting.date}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              'Время: ${meeting.time}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.gps_fixed),
          color: Color(0xFFFFFFFF),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MeetingDetail()));
          },
        ),
      ),
    );
  }
}