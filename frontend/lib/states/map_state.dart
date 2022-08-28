import 'dart:async';
import 'package:cartoswiss/model/place.dart';
import 'package:cartoswiss/services/assets.dart';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends BaseState {
  final Set<Marker> markers = {};
  final Completer<GoogleMapController> _completer = Completer();
  bool mapReady = false;

  CameraPosition initialPosition() => const CameraPosition(
        target: LatLng(46.194641, 6.143514),
        zoom: 18,
      );

  Future onMapCreated(GoogleMapController controller) async {
    _completer.complete(controller);
    final String mapStyle = await rootBundle.loadString(Assets.MAP_STYLE);
    await controller.setMapStyle(mapStyle);
    await Future.delayed(const Duration(seconds: 1));
    mapReady = true;
    notify();

    _addPlace(const Place(
      id: '123',
      name: 'Chic Chicken',
      latLng: LatLng(46.1953403, 6.1422464),
    ));
  }

  void _addPlace(Place place) {
    markers.add(
      Marker(
        markerId: MarkerId(place.id),
        position: place.latLng,
        onTap: () {
          _centerTo(
            latLng: place.latLng,
            zoom: 18,
          );
        },
      ),
    );
  }

  Future _centerTo({
    required LatLng latLng,
    required double zoom,
  }) async {
    final GoogleMapController controller = await _completer.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: zoom,
        ),
      ),
    );
  }
}
