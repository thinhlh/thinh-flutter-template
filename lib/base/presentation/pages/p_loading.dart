import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tfc/base/presentation/pages/p_provider.dart';
import 'package:tfc/base/presentation/providers/base_loading_provider.dart';

abstract class LoadingPage<T extends LoadingProvider> extends PageProvider<T> {
  LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parent = super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          parent,
          buildPage(context),
        ],
      ),
    );
  }
}
