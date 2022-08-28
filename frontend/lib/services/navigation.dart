import 'package:cartoswiss/model/place.dart';
import 'package:cartoswiss/screens/place_screen.dart';
import 'package:cartoswiss/services/initializer.dart';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';

class Navigation {
  final Routes routes = Routes();

  static Navigation get get => locator<Navigation>();

  static void pop<T>([T? result]) => get.routes.pop();

  static void dialog(Widget widget) => get.routes.push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, _, __) => widget,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );

  static void placeScreen(Place place) => get.routes.push(
        FadeRoute(
          PlaceScreen.instance(place),
          duration: const Duration(seconds: 1),
          name: 'place',
        ),
      );
}
