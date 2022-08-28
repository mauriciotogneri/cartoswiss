import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final LatLng latLng;
  final String canton;
  final String postcode;
  final String? address;

  const Location({
    required this.latLng,
    required this.canton,
    required this.postcode,
    this.address,
  });
}
