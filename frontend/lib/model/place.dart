import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String id;
  final String name;
  final LatLng latLng;

  const Place({
    required this.id,
    required this.name,
    required this.latLng,
  });
}
