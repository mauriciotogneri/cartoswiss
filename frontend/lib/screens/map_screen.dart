import 'package:cartoswiss/states/map_state.dart';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final MapState state;

  const MapScreen(this.state);

  factory MapScreen.instance() => MapScreen(MapState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(state),
    );
  }
}

class Content extends StatelessWidget {
  final MapState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    return StateProvider<MapState>(
      state: state,
      builder: (context, state) => SizedBox(
        width: state.mapReady ? double.infinity : 1,
        height: state.mapReady ? double.infinity : 1,
        child: GoogleMap(
          mapType: MapType.normal,
          markers: state.markers,
          initialCameraPosition: state.initialPosition(),
          onMapCreated: state.onMapCreated,
        ),
      ),
    );
  }
}
