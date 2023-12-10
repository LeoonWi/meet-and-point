import 'package:flutter/material.dart';

class Participant {
  final String name;

  Participant({required this.name});
}

class MeetingParticipantsPage extends StatelessWidget {
  final List<Participant> participants = [
    Participant(name: 'Даня'),
    Participant(name: 'Давид'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF285BC0),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Список участников встречи',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              participants.isEmpty
                  ? Center(
                child: Text(
                  'Нет участников',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: participants.length,
                  itemBuilder: (context, index) {
                    return ParticipantListItem(
                      participant: participants[index],
                      canInvite: index % 2 == 0,
                      onInvite: () {
                        print('Invite button pressed for ${participants[index].name}');
                      },
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

class ParticipantListItem extends StatelessWidget {
  final Participant participant;
  final bool canInvite;
  final VoidCallback onInvite;

  const ParticipantListItem({
    Key? key,
    required this.participant,
    required this.canInvite,
    required this.onInvite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          participant.name,
          style: TextStyle(
            color: Color(0xFF285BC0),
          ),
        ),
        trailing: canInvite
            ? IconButton(
          icon: Icon(Icons.person_add),
          color: Color(0xFF285BC0),
          onPressed: onInvite,
        )
            : null,
      ),
    );
  }
}