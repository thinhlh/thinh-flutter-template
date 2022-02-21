import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:tfc/base/presentation/pages/p_provider.dart';
import 'package:tfc/base/presentation/providers/loading_provider.dart';
import 'package:tfc/services/dialogs/app_loading.dart';

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
          Selector<T, bool>(
              selector: (_, provider) => provider.isLoading,
              builder: (_, isLoading, child) {
                SchedulerBinding.instance?.addPostFrameCallback((_) => isLoading
                    ? AppLoading.showLoading(context)
                    : AppLoading.dismissLoading(context));
                return Container();
              })
        ],
      ),
    );
  }
}
