import 'package:flutter/material.dart';
import 'package:meet_and_point/api/api.dart';
import 'package:meet_and_point/map_screen.dart';
import 'package:meet_and_point/widget/drawer.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  final int id;

  HomePage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => HomePageState();
}


class HomePageState extends State<HomePage> {

  String name = 'name';
  String email = 'email';
  String password = 'password';

  void getData() async {
    final results = await Api().showUser(widget.id);
    name = results['name'];
    email = results['email'];
    password = results['password'];
    setState(() {});
  }

  Future<List<LatLng>> getMarker() async {
    List resultsMarker = await Api().showListMarker(widget.id);
    List<LatLng> getMarkerList = [];
    for(int i=0;i<resultsMarker.length;i++) {
      getMarkerList.add(LatLng(resultsMarker[i]["latitude"], resultsMarker[i]["longitude"]));
    }
    return getMarkerList!;
  }


  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LatLng>>(
      future: getMarker(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Ошибка при загрузке данных');
          } else {
            var data = snapshot.data as List<LatLng>;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                drawer: DrawerSide(name: name!, email: email!, password: password!),
                body: Stack(
                  children: [
                    MapScreen(markerList: data, indexFlag: 0, allowOnTap: true, idUser: widget.id, userName: name),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        color: Color(0xFF102F6A),
                child: Container(
                  width: double.infinity,
                  height: 62,
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer(); // Открыть боковое меню
                              },
                              icon: const Icon(Icons.menu),
                              color: Colors.white,
                              iconSize: 35,
                            );
                          },
                        ),
                        const SizedBox(width: 53,),
                        const Text(
                          "Meet'N'Point",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
                    )
                  ],
                ),
              )
            );
          }
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Color(0xFF102F6A)
              ),
            ),
          );
        }
      }
    );
  }
}