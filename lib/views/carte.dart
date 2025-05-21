import 'package:cinema/api/etablissement_service.dart';
import 'package:cinema/models/etablissement.dart';
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
  final _mapController = MapController();
  LatLng _positionUtilisateur = const LatLng(47, 6.5);

  final service = EtablissementService();

  List<Marker> _markers = [];

  Feature? _selectedEtablissement;
  Offset? _popupPosition;

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

  Widget _buildPopup(Feature e) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              e.properties.nom,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(e.properties.voie, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  void _fetchEtablissementsDansVue() {
    final bounds = _mapController.camera.visibleBounds;

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
                      debugPrint("OnTap");
                      final projected = _mapController.camera.projectAtZoom(
                        LatLng(
                          e.geometry.coordinates[1],
                          e.geometry.coordinates[0],
                        ),
                      );

                      final screenPoint = _mapController.camera.projectAtZoom(
                        LatLng(
                          e.geometry.coordinates[1],
                          e.geometry.coordinates[0],
                        ),
                      );
                      ;

                      final popupOffset = Offset(
                        projected.dx.toDouble(),
                        projected.dy.toDouble(),
                      );

                      debugPrint("${popupOffset}");
                      setState(() {
                        _selectedEtablissement = e;
                        _popupPosition = popupOffset;
                      });

                      /*showDialog(
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
                      );*/
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
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _positionUtilisateur,
              initialZoom: 11.0,
              onMapReady: _fetchEtablissementsDansVue,
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) {
                  _fetchEtablissementsDansVue();
                }
                // Fermer l'infobulle en cas de déplacement
                setState(() {
                  _selectedEtablissement = null;
                  _popupPosition = null;
                });
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
              /*MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 45,
            size: const Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: const FitBoundsOptions(padding: EdgeInsets.all(50)),
            markers: markers,
            popupOptions: PopupOptions(
              popupController: _popupController,
              popupBuilder: (context, marker) => const Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("POI"),
                ),
              ),
            ),
            builder: (context, cluster) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    cluster.count.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),*/
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
          if (_selectedEtablissement != null && _popupPosition != null)
            Positioned(
              left:
                  _popupPosition!.dx -
                  75, // ajuster en fonction de la largeur de la bulle
              top:
                  _popupPosition!.dy -
                  100, // ajuster pour mettre au-dessus du marker
              child: _buildPopup(_selectedEtablissement!),
            ),
        ],
      ),
    );
  }
}
