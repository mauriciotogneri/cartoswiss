import 'package:cartoswiss/model/place.dart';
import 'package:cartoswiss/states/place_state.dart';
import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  final PlaceState state;

  const PlaceScreen(this.state);

  factory PlaceScreen.instance(Place place) => PlaceScreen(PlaceState(place));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.place.name),
      ),
      body: SafeArea(
        child: Center(
          child: Text(state.place.name),
        ),
      ),
    );
  }
}
