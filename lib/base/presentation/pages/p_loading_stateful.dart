import 'package:flutter/material.dart';
import 'package:tfc/base/presentation/pages/p_stateful.dart';
import 'package:tfc/base/presentation/providers/loading_provider.dart';
import 'package:tfc/base/presentation/widgets/w_loading_builder.dart';

abstract class PageLoadingStateful<T extends LoadingProvider>
    extends PageStateful<T> {
  PageLoadingStateful({Key? key}) : super(key: key);
}

abstract class PageLoadingState<T extends LoadingProvider>
    extends PageState<T> {
  @override
  Widget build(BuildContext context) {
    final parent = super.build(context);

    return WidgetLoadingBuilder<T>(buildPage(context), parent);
  }
}
