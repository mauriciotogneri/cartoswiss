import 'dart:async';
import 'package:cartoswiss/model/link.dart';
import 'package:cartoswiss/model/location.dart';
import 'package:cartoswiss/model/place.dart';
import 'package:cartoswiss/services/assets.dart';
import 'package:cartoswiss/services/navigation.dart';
import 'package:cartoswiss/types/tag_type.dart';
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

    _addPlace(Place(
      id: '123',
      name: 'Chic Chicken',
      location: const Location(
        latLng: LatLng(46.1953403, 6.1422464),
        canton: 'GE',
        postcode: '1205',
        address: "Bd du Pont-d'Arve 28, 1205 Genève",
      ),
      tags: const [TagType.restaurant],
      links: [
        Link.website('https://www.chic-chicken.ch'),
        Link.email('contact@chic-chicken.com'),
        Link.phone('0223205344'),
        Link.google('https://goo.gl/maps/TxjL8hZD8GNKyQUV9'),
        Link.facebook('https://www.facebook.com/chic.chickenSwitzerland'),
        Link.instagram('https://www.instagram.com/chic_chicken.ch'),
      ],
    ));
  }

  void _addPlace(Place place) => markers.add(
        Marker(
          markerId: MarkerId(place.id),
          position: place.location.latLng,
          onTap: () {
            _centerTo(
              latLng: place.location.latLng,
              zoom: 18,
            );
            Navigation.placeScreen(place);
          },
        ),
      );

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
