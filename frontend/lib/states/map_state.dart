import 'dart:async';
import 'package:cartoswiss/services/assets.dart';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends BaseState {
  final Completer<GoogleMapController> _controller = Completer();

  Future onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);

    final String json = await rootBundle.loadString(Assets.MAP_STYLE);
    controller.setMapStyle(json);
  }
}
