import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;

class StoryDetailMap extends StatefulWidget {
  final double lat;
  final double lon;

  const StoryDetailMap({required this.lat, required this.lon, super.key});

  @override
  State<StoryDetailMap> createState() => _StoryDetailMapState();
}

class _StoryDetailMapState extends State<StoryDetailMap> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _createMarker();
  }

  Future<void> _createMarker() async {
    final latLng = LatLng(widget.lat, widget.lon);
    String address = 'Lokasi Story';
    try {
      final placemarks = await geo.placemarkFromCoordinates(
        widget.lat,
        widget.lon,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        address = '${place.street}, ${place.locality}';
      }
    } catch (_) {}

    if (mounted) {
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId('story-location'),
            position: latLng,
            infoWindow: InfoWindow(title: 'Lokasi Story', snippet: address),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.lon),
            zoom: 15,
          ),
          markers: _markers,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          mapToolbarEnabled: true,
        ),
      ),
    );
  }
}
