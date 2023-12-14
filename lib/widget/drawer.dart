import 'package:flutter/material.dart';
import 'package:meet_and_point/auth/login.dart';
import 'package:meet_and_point/configure.dart';
import 'package:meet_and_point/friends.dart';
import 'package:meet_and_point/meetinglist.dart';
import 'package:meet_and_point/widget/ListTileOwn.dart';

class DrawerSide extends StatelessWidget {
  int idUser;
  String name;
  String email;
  String password;
  DrawerSide({super.key,required this.idUser, required this.name, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF285BC0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 39,
              decoration: ShapeDecoration(
                color: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF102E6A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
            )
          ),
          const SizedBox(height: 100),
          ListTile(
            style: ListTileStyle.list,
            title: const ListTileOwn(value: 'Встречи'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MeetingListPage(idUser: idUser, username: name)));
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const ListTileOwn(value: 'Друзья'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FriendListPage()));
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const ListTileOwn(value: 'Настройки'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ConfigPage()));
            },
          ),
          const SizedBox(height: 100),
          ListTile(
            title: ListTileOwn(value: 'Выход'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }

}