import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key, required List<LatLng> this.markerList});
  List<LatLng> markerList;


  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final _mapController = MapController();
  List<Placemark> location = [];
  List<Marker> mapPoints = [];

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
            initialCenter: const LatLng(49.5, -0.09),
            initialZoom: 5.0,
            onTap: (TapPosition p, LatLng l) async {
              // location = await placemarkFromCoordinates(l.latitude, l.longitude);
              // debugPrint("${location}");
              setState(() {
                mapPoints.add(
                    Marker(
                      point: l,
                      child: Image.asset('assets/icons/map_marker.png'),
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                    )
                );
              });
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
        )
      ]
    );
  }
}