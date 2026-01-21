import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:story_app/src/features/story/presentation/presentation.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  final LatLng _defaultLocation = const LatLng(-6.1753924, 106.8271528);

  LatLng? _selectedLocation;
  String _address = 'Pilih lokasi dengan menekan peta';
  bool _isLoadingAddress = false;

  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  Future<void> _getAddress(double lat, double lon) async {
    setState(() {
      _isLoadingAddress = true;
    });

    try {
      final placemarks = await geo.placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        final fullAddress = [
          place.street,
          place.subLocality,
          place.locality,
          place.postalCode,
          place.country,
        ].where((element) => element != null && element.isNotEmpty).join(', ');

        setState(() {
          _address = fullAddress;
        });
      }
    } catch (e) {
      setState(() {
        _address = 'Gagal memuat alamat';
      });
    } finally {
      setState(() {
        _isLoadingAddress = false;
      });
    }
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
      _markers.clear();
      _markers.add(
        Marker(markerId: const MarkerId('selected-location'), position: latLng),
      );
    });
    _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
    _getAddress(latLng.latitude, latLng.longitude);
  }

  void _confirmSelection() {
    if (_selectedLocation != null) {
      context.pop({'latLng': _selectedLocation, 'address': _address});
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _defaultLocation,
            zoom: 15,
          ),
          onMapCreated: (controller) => _mapController = controller,
          markers: _markers,
          onTap: _onMapTapped,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
        ),
        if (_selectedLocation != null)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LocationCard(
              address: _address,
              onPressed: _confirmSelection,
              isLoadingAddress: _isLoadingAddress,
              selectedLocation: _selectedLocation,
            ),
          ),
      ],
    ),
  );
}
