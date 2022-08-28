import 'package:cartoswiss/services/initializer.dart';
import 'package:dafluta/dafluta.dart';

class Navigation {
  final Routes routes = Routes();

  static Navigation get get => locator<Navigation>();

  static void pop<T>([T? result]) => get.routes.pop();

  /*static void exampleScreen() => get.routes.pushAlone(
        FadeRoute(
          ExampleScreen.instance(),
          duration: const Duration(seconds: 1),
          name: 'example',
        ),
      );*/
}
