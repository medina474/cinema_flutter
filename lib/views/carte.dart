import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class CarteWidget extends StatefulWidget {
  const CarteWidget({super.key});

  @override
  State<CarteWidget> createState() => _CarteWidgetState();
}

class _CarteWidgetState extends State<CarteWidget> {
  final MapController _mapController = MapController();
  LatLng _positionUtilisateur = const LatLng(47, 6.5);

  @override
  void initState() {
    super.initState();
    _getPosition();
  }

  Future<void> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Vérifiez si les services de localisation sont activés
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Les services de localisation ne sont pas activés, ne poursuivez pas
      return;
    }

    // Vérifiez les permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Les permissions sont refusées, ne poursuivez pas
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Les permissions sont refusées de façon permanente, ne poursuivez pas
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    _positionUtilisateur = LatLng(position.latitude, position.longitude);

    setState(() {
      _mapController.move(_positionUtilisateur, 12.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carte")),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _positionUtilisateur,
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            // Bring your own tiles
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'univ-lorraine.iutsd.cinema',
            tileProvider: CancellableNetworkTileProvider(),
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
