import 'package:flutter/material.dart';
import 'package:tfc/base/presentation/pages/page_actions.dart';
import 'package:provider/provider.dart';
import 'package:tfc/services/dialogs/app_loading.dart';
import 'package:tfc/services/rest_api/api/api_error.dart';

abstract class PageStateless<T extends ChangeNotifier> extends StatelessWidget
    with ApiError
    implements PageActions<T> {
  const PageStateless({
    Key? key,
  }) : super(key: key);

  @override
  @mustCallSuper
  void initDependencies(BuildContext context) {}

  @override
  void showLoading(BuildContext context, bool show) {
    if (show) {
      AppLoading.show(context);
    } else {
      AppLoading.dismiss(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<T>(context, listen: false);
    initDependencies(context);

    return Scaffold(
      body: buildPage(
        context,
        provider,
      ),
    );
  }
}
