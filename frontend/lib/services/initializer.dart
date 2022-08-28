import 'package:cartoswiss/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';

final GetIt locator = GetIt.instance;

class Initializer {
  static Future load() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    locator.registerSingleton<Navigation>(Navigation());
  }
}
