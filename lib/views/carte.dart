import 'package:cinema/api/etablissement_service.dart';
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

  final service = EtablissementService();

  List<Marker> _markers = [];

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

    // Affiche rapidement la carte centrée
    setState(() {
      _mapController.move(_positionUtilisateur, 11.0);
    });

    // attendre un petit délai pour que la carte ait bien rendu son état
    Future.delayed(const Duration(milliseconds: 500), () {
      _fetchEtablissementsDansVue();
    });
  }

  void _fetchEtablissementsDansVue() {
    final camera = _mapController.camera;
    final bounds = camera.visibleBounds;

    service
        .fetch(bounds)
        .then((etablissements) {
          final markers =
              etablissements.map<Marker>((e) {
                return Marker(
                  point: LatLng(
                    e.geometry.coordinates[1],
                    e.geometry.coordinates[0],
                  ),
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text(e.properties.nom),
                              content: Text(e.properties.voie),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Fermer"),
                                ),
                              ],
                            ),
                      );
                    },
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                );
              }).toList();

          if (mounted) {
            setState(() {
              _markers = markers;
            });
          }
        })
        .catchError((e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  "Erreur lors du fetch des établissements : $e",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
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
          initialZoom: 11.0,
          onMapReady: _fetchEtablissementsDansVue,
          onPositionChanged: (position, hasGesture) {
            if (hasGesture) {
              _fetchEtablissementsDansVue();
            }
          },
        ),
        children: [
          TileLayer(
            // Bring your own tiles
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'univ-lorraine.iutsd.cinema',
            tileProvider: CancellableNetworkTileProvider(),
          ),
          MarkerLayer(markers: _markers),
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
