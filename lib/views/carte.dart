import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarteWidget extends StatefulWidget {
  const CarteWidget({super.key});

  @override
  State<CarteWidget> createState() => _CarteWidgetState();
}

class _CarteWidgetState extends State<CarteWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carte")),
      body: FlutterMap(
        options: MapOptions(initialCenter: LatLng(47, 6.5), initialZoom: 9.2),
        children: [
          TileLayer(
            // Bring your own tiles
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'univ-lorraine.iutsd.cinema',
          ),
          RichAttributionWidget(
            // Include a stylish prebuilt attribution widget that meets all requirments
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap:
                    () => debugPrint(
                      'https://openstreetmap.org/copyright',
                    ), // (external)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
