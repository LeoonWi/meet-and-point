import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF285BC0),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Bar Title'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Implement action for Item 1
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Implement action for Item 2
                },
              ),
              // Add more ListTile widgets for other drawer items
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              const SizedBox(height: 169),
              const Text(
                'Список встреч',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(height: 113),
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
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          meeting.title,
          style: TextStyle(
            color: Color(0xFF285BC0),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Место: ${meeting.place}',
              style: TextStyle(
                color: Color(0xFF285BC0),
              ),
            ),
            Text(
              'Дата: ${meeting.date}',
              style: TextStyle(
                color: Color(0xFF285BC0),
              ),
            ),
            Text(
              'Время: ${meeting.time}',
              style: TextStyle(
                color: Color(0xFF285BC0),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.gps_fixed),
          color: Color(0xFF285BC0),
          onPressed: onGPS,
        ),
      ),
    );
  }
}