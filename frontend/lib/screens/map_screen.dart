import 'package:cartoswiss/services/palette.dart';
import 'package:cartoswiss/states/map_state.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Carto Swiss',
        style: TextStyle(color: Palette.white),
      ),
    );
  }
}
