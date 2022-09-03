import 'package:flutter/material.dart';
import 'package:tfc/base/presentation/pages/page_actions.dart';

abstract class PageStatefulAction<T extends ChangeNotifier>
    extends PageActions<T> {
  /// This function will be called after the first build
  void afterFirstBuild(BuildContext context);
}
