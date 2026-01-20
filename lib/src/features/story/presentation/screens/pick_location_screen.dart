import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  final LatLng _defaultLocation = const LatLng(-6.1753924, 106.8271528);

  LatLng? _selectedLocation;
  String _address = 'Pilih lokasi dengan menekan peta';
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  Future<void> _getAddress(double lat, double lon) async {
    try {
      final placemarks = await geo.placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        setState(() {
          _address = '${place.street}, ${place.subLocality}, ${place.locality}';
          _markers.clear();
          _markers.add(
            Marker(
              markerId: const MarkerId('selected-location'),
              position: LatLng(lat, lon),
              infoWindow: InfoWindow(
                title: 'Lokasi Terpilih',
                snippet: _address,
              ),
            ),
          );
        });
        _mapController?.showMarkerInfoWindow(
          const MarkerId('selected-location'),
        );
      }
    } catch (e) {
      setState(() {
        _address = 'Gagal memuat alamat';
      });
    }
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
    });
    _getAddress(latLng.latitude, latLng.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = theme.appBarTheme.foregroundColor ?? Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilih Lokasi',
          style: theme.textTheme.titleLarge?.copyWith(color: appBarColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_outlined),
            onPressed: _selectedLocation == null
                ? null
                : () {
                    context.pop({
                      'latLng': _selectedLocation,
                      'address': _address,
                    });
                  },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Theme.of(context).cardColor,
            child: Text(
              _address,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _defaultLocation,
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              markers: _markers,
              onTap: _onMapTapped,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
