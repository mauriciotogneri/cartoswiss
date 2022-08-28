import 'package:cartoswiss/services/palette.dart';
import 'package:cartoswiss/states/map_state.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final MapState state;

  const MapScreen(this.state);

  factory MapScreen.instance() => MapScreen(MapState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      body: Content(state),
    );
  }
}

class Content extends StatelessWidget {
  final MapState state;

  const Content(this.state);

  CameraPosition get _cameraPosition => const CameraPosition(
        target: LatLng(46.194641, 6.143514),
        zoom: 18,
      );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      buildingsEnabled: false,
      initialCameraPosition: _cameraPosition,
      onMapCreated: state.onMapCreated,
    );
  }
}
