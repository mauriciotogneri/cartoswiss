import 'dart:async';
import 'package:dafluta/dafluta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends BaseState {
  final Completer<GoogleMapController> controller = Completer();
}
