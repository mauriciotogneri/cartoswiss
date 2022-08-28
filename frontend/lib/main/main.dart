import 'package:cartoswiss/app/carto_swiss.dart';
import 'package:cartoswiss/services/initializer.dart';
import 'package:flutter/material.dart';

void main() async {
  await Initializer.load();
  runApp(const CartoSwiss());
}
