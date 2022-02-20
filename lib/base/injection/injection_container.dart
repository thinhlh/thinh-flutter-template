import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  final getIt = GetIt.instance;

  Future<void> init();
}
