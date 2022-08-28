import 'dart:async';
import 'package:cartoswiss/services/assets.dart';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends BaseState {
  String _mapStyle = '';
  bool styleApplied = false;

  final Completer<GoogleMapController> _completer = Completer();

  bool get styleReady => _mapStyle.isNotEmpty;

  @override
  Future onLoad() async {
    super.onLoad();

    _mapStyle = await rootBundle.loadString(Assets.MAP_STYLE);
    notify();
  }

  CameraPosition initialPosition() => const CameraPosition(
        target: LatLng(46.194641, 6.143514),
        zoom: 18,
      );

  Future onMapCreated(GoogleMapController controller) async {
    _completer.complete(controller);
    await controller.setMapStyle(_mapStyle);
    styleApplied = true;
    notify();
  }

  Future goTo({
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
