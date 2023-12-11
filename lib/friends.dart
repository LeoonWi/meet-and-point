import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String phone;

  Friend({required this.name, required this.phone});
}

class FriendListPage extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'Даня', phone: '555-1234'),
    Friend(name: 'Давид', phone: '555-5678'),
  ];

  FriendListPage({super.key});

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
          title: const Text('Друзья', textAlign: TextAlign.center, style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600
          )),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              friends.isEmpty
                  ? Center(
                child: Text(
                  'Нет друзей',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    return FriendListItem(
                      friend: friends[index],
                      onDelete: () {},
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

class FriendListItem extends StatelessWidget {
  final Friend friend;
  final VoidCallback onDelete;

  const FriendListItem({
    Key? key,
    required this.friend,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF102F6A),
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          friend.name,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        subtitle: Text(
          friend.phone,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Color(0xFFFFFFFF),
          onPressed: onDelete,
        ),
      ),
    );
  }
}