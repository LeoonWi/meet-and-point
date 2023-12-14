import 'package:flutter/material.dart';
import 'package:meet_and_point/api/api.dart';
import 'package:meet_and_point/home.dart';
import 'package:meet_and_point/meetingdetail.dart';


class Meeting {
  final int id;
  final String title;
  final String username;
  final double latitude;
  final double longitude;
  final String date;
  final int idUser;

  Meeting({
    required this.id,
    required this.title,
    required this.username,
    required this.latitude,
    required this.longitude,
    required this.date,
    required this.idUser
  });
}

class MeetingListPage extends StatefulWidget {

  int idUser;
  String username;
  MeetingListPage({super.key, required this.idUser, required this.username});

  @override
  State<MeetingListPage> createState() => _MeetingListPageState();
}

class _MeetingListPageState extends State<MeetingListPage> {



  final List<Meeting> meetings = [];
  
  void getData() async {
    final response = await Api().showMeeting(widget.idUser);
    if (response[0]["message"] != "Error") {
      for (int i = 0; i < response.length; i++) {
        meetings.add(Meeting(
            id: response[i]["id"],
            title: response[i]["name"],
            latitude: response[i]["latitude"],
            longitude: response[i]["longitude"],
            date: response[i]["date"],
            idUser: widget.idUser,
            username: widget.username
        ));
        setState(() {});
      }
    }
  }

  @override
  void initState(){
    getData();
    super.initState();

  }

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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext) => HomePage(
                id: widget.idUser,
              )));
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
              'Ш: ${meeting.latitude}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              'Д: ${meeting.longitude}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              'Дата: ${meeting.date}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            )
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.gps_fixed),
          color: Color(0xFFFFFFFF),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MeetingDetail(id: meeting.id, idUser: meeting.idUser, name: meeting.title, latitude: meeting.latitude, longitude: meeting.longitude, date: meeting.date, username: meeting.username)));
          },
        ),
      ),
    );
  }
}