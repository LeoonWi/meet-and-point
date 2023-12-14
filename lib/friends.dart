import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String phone;

  Friend({required this.name, required this.phone});
}

class FriendRequest {
  final String name;
  final String phone;

  FriendRequest({required this.name, required this.phone});
}

class FriendListPage extends StatefulWidget {
  FriendListPage({Key? key}) : super(key: key);
  @override
  stateFriendList createState() => stateFriendList();
}

class stateFriendList extends State<FriendListPage>{
  final List<Friend> friends = [
    Friend(name: 'Даня', phone: '555-1234'),
    Friend(name: 'Давид', phone: '555-5678'),
  ];

  final List<FriendRequest> friendRequests = [
    FriendRequest(name: 'Алекс', phone: '555-9876'),
    FriendRequest(name: 'Марина', phone: '555-4321'),
  ];

  void addFriend(FriendRequest request) {
    setState(() {
      friends.add(Friend(name: request.name, phone: request.phone));
      friendRequests.remove(request);
    });
  }

  void removeRequest(FriendRequest request) {
    setState(() {
      friendRequests.remove(request);
    });
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
          backgroundColor: const Color(0xFF102F6A),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_backspace),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: friendRequests.length,
                  itemBuilder: (_, index) {
                    return FriendRequestItem(
                      request: friendRequests[index],
                      onAccept: () => addFriend(friendRequests[index]),
                      onDecline: () => removeRequest(friendRequests[index]),
                    );
                  },
                ),
              ),
              const Divider(color: Colors.white, thickness: 3),
              const SizedBox(height: 16.0),
              friends.isEmpty
                  ? const Center(
                child: Text(
                  'Нет друзей',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
                  : Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (_, index) {
                    return FriendListItem(
                      friend: friends[index],
                      onDelete: () {
                        setState(() {
                          friends.removeAt(index);
                        });
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

class FriendRequestItem extends StatelessWidget {
  final FriendRequest request;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const FriendRequestItem({
    Key? key,
    required this.request,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF102F6A),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          request.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          request.phone,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check),
              color: Colors.green,
              onPressed: onAccept,
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              color: Colors.red,
              onPressed: onDecline,
            ),
          ],
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
      color: const Color(0xFF102F6A),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          friend.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          friend.phone,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.white,
          onPressed: onDelete,
        ),
      ),
    );
  }
}