import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meet_and_point/meetingdetail.dart';
import 'package:meet_and_point/createMeeting.dart';

class MapScreen extends StatefulWidget {
  List<LatLng> markerList;
  int indexFlag;
  bool allowOnTap;
  LatLng? initCenter;
  double? initZoom;
  int idUser;
  String? userName;


  MapScreen({
    super.key,
    required this.markerList,
    required this.indexFlag,
    required this.allowOnTap,
    this.initCenter,
    this.initZoom,
    required this.idUser,
    this.userName,
  });

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final _mapController = MapController();
  // List<Placemark> location = [];
  List<Marker> mapPoints = [];
  double currentZoom = 9.0;

  List<int> get _flags => const [
    InteractiveFlag.all & ~InteractiveFlag.rotate,
    InteractiveFlag.none,
  ];

  /// Метод генерации маркеров
  List<Marker> _getMarkers(List<LatLng> mapPoints) {
    return List.generate(
      mapPoints.length,
          (index) => Marker(
        point: mapPoints[index],
        child: Image.asset('assets/icons/map_marker.png'),
        width: 50,
        height: 50,
        alignment: Alignment.center,
      ),
    );
  }

  @override
  void initState() {
    mapPoints = _getMarkers(widget.markerList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: (widget.initCenter != null) ? widget.initCenter! : const LatLng(55.749448, 37.624705),
            initialZoom: (widget.initZoom != null) ? widget.initZoom! : 9.0,
            cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(-90, -180),
                  const LatLng(90, 180)
                )
            ),
            interactionOptions: InteractionOptions(
              flags: _flags[widget.indexFlag],
            ),
            onPositionChanged: (position, hasGesture) {
              currentZoom = _mapController.zoom;
            },
            onTap: (TapPosition p, LatLng l) async {
              if (widget.allowOnTap == true) {
                // location = await placemarkFromCoordinates(l.latitude, l.longitude);
                // debugPrint("${location}");
                if(mapPoints.length > widget.markerList.length) mapPoints.removeAt(widget.markerList.length);
                mapPoints.add(
                    Marker(
                      point: l,
                      child: Image.asset('assets/icons/map_marker.png'),
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                    )
                );
                // debugPrint(l.latitude.toString());
                // debugPrint(l.longitude.toString());
                _mapController.move(l, currentZoom);
                setState(() {});
                showBottomSheet(context: context, backgroundColor: Colors.transparent, elevation: 0, builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        children: <Widget>[
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  mapPoints.removeAt(widget.markerList.length);
                                });
                              },
                              icon: const Icon(Icons.close),
                              iconSize: 50,
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.red[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  fixedSize: const Size(80, 80)
                              )
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext) => createMeeting(idUser: widget.idUser, markerList: [l], userName: widget.userName!,)));
                              },
                              icon: const Icon(Icons.check),
                              iconSize: 50,
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.green[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  fixedSize: const Size(80, 80)
                              )
                          ),
                          const Spacer()
                        ]
                    ),
                  );
                });
                debugPrint(l.toString());
              }
            }
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.flutter_map_example',
            ),
            MarkerLayer(
                markers: mapPoints,
            ),
          ]
        ),
      ]
    );
  }
}
