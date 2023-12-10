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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF285BC0),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              const SizedBox(height: 169),
              const Text(
                'Список друзей',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(height: 113),
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
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          friend.name,
          style: TextStyle(
            color: Color(0xFF285BC0),
          ),
        ),
        subtitle: Text(
          friend.phone,
          style: TextStyle(
            color: Color(0xFF285BC0),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Color(0xFF285BC0),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your app bar title widget here
    return Text('App Bar Title');
  }
}