import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/base/presentation/pages/page_stateful_actions.dart';
import 'package:tfc/services/dialogs/app_loading.dart';
import 'package:tfc/services/rest_api/api/api_error.dart';

abstract class PageStateful<T extends StatefulWidget, P extends ChangeNotifier>
    extends State<T>
    with WidgetsBindingObserver, ApiError
    implements PageStatefulAction<P> {
  late final P provider;
  late final NavigatorState navigator;

  bool _initialized = false;

  @override
  @mustCallSuper
  void afterFirstBuild(BuildContext context) {}

  @override
  @mustCallSuper
  void initDependencies(BuildContext context) {
    provider = context.read<P>();
    navigator = Navigator.of(context);
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        afterFirstBuild(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized == false) {
      initDependencies(context);
      _initialized = true;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void showLoading(BuildContext context, bool show) {
    if (mounted) {
      if (show) {
        AppLoading.show(context);
      } else {
        AppLoading.dismiss(context);
      }
    }
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return buildPage(context, provider);
  }
}
