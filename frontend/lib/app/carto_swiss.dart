import 'package:cartoswiss/screens/map_screen.dart';
import 'package:cartoswiss/services/navigation.dart';
import 'package:cartoswiss/services/palette.dart';
import 'package:flutter/material.dart';

class CartoSwiss extends StatelessWidget {
  const CartoSwiss();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carto Swiss',
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.get.routes.key,
      theme: ThemeData(
        primaryColor: Palette.primary,
        primarySwatch: Palette.primary,
        backgroundColor: Palette.white,
        scaffoldBackgroundColor: Palette.white,
      ),
      home: MapScreen.instance(),
    );
  }
}
