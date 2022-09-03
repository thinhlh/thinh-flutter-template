import 'package:flutter/material.dart';

abstract class PageActions<T extends ChangeNotifier> {
  /// Will be called right before build method is executed
  void initDependencies(BuildContext context);

  /// In Stateful pages, it will be executed after initState

  void showLoading(BuildContext context, bool show);

  Widget buildPage(BuildContext context, T provider);
}
