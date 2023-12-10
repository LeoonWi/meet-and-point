import 'package:flutter/material.dart';
import 'package:meet_and_point/widget/ListTileOwn.dart';

class DrawerSide extends StatelessWidget {
  String name;
  DrawerSide({super.key, required this.name});

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
            title: const ListTileOwn(value: 'Встречи'),
            onTap: () {

            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const ListTileOwn(value: 'Друзья'),
            onTap: () {

            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const ListTileOwn(value: 'Настройки'),
            onTap: () {

            },
          ),
          const SizedBox(height: 100),
          ListTile(
            title: ListTileOwn(value: 'Выход'),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }

}