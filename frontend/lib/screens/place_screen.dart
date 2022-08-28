import 'package:cartoswiss/model/place.dart';
import 'package:cartoswiss/services/navigation.dart';
import 'package:cartoswiss/services/palette.dart';
import 'package:cartoswiss/states/place_state.dart';
import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  final PlaceState state;

  const PlaceScreen._(this.state);

  factory PlaceScreen.instance(Place place) => PlaceScreen._(PlaceState(place));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.place.name),
        backgroundColor: Palette.white,
        titleTextStyle: const TextStyle(
          color: Palette.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: const [
          IconButton(
            icon: Icon(Icons.close),
            color: Palette.black,
            onPressed: Navigation.pop,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text(state.place.name),
        ),
      ),
    );
  }
}
