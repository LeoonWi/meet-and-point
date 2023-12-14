import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:meet_and_point/api/api.dart';
import 'package:meet_and_point/friendslistmeeting.dart';
import 'package:meet_and_point/map_screen.dart';
import 'package:meet_and_point/meetinglist.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:meet_and_point/meetingdetail.dart';
import 'package:intl/intl.dart';

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
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = '';

  @override
  Widget build(BuildContext context) {
    formattedDate = formatter.format(now.toLocal());
    print(formattedDate);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
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
                    width: 160,
                    height: 160,
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
                  height: 500,
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
                        style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ш: ${widget.markerList[0].latitude}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Д: ${widget.markerList[0].longitude}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      TableCalendar(
                          rowHeight: 40,
                          focusedDay: now,
                          firstDay: DateTime(2022,01,01),
                          lastDay: DateTime(2049,01,01),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(color: Colors.white),
                            weekendStyle: TextStyle(color: Colors.white),
                          ),
                          calendarStyle: const CalendarStyle(
                            defaultTextStyle: TextStyle(color: Colors.white),
                            weekendTextStyle: TextStyle(color: Colors.red),
                          ),
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(color: Colors.white),
                            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white,),
                            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white,)
                          ),
                          selectedDayPredicate: (day) {
                            return isSameDay(day, now);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              now = selectedDay;
                              formattedDate = formatter.format(now.toLocal());
                            });
                            print(formattedDate);
                          }
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    // SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        if(_nameMeeting.text != null) {
                          final response = await Api().createMeeting(
                              _nameMeeting.text,
                              widget.markerList[0].latitude,
                              widget.markerList[0].longitude,
                              formattedDate,
                              widget.idUser);
                          if (response == "Successfully") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => MeetingListPage(
                                          idUser: widget.idUser,
                                          username: widget.userName,
                                        )));
                          }
                        }
                      },
                      child: const Text('Сохранить', style: TextStyle(color: Color(0xFF102F6A))),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(182, 44)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}