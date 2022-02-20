import 'package:tfc/app/home/home_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await HomeInjectionContainer.instance.init();
  }
}
