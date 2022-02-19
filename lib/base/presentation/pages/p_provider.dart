import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:tfc/base/presentation/providers/base_dialog_provider.dart';
import 'package:tfc/base/presentation/widgets/app_dialog.dart';

abstract class PageProvider<T extends DialogProvider> extends StatelessWidget {
  PageProvider({Key? key}) : super(key: key);

  late final T provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<T>(context, listen: false);

    return Scaffold(
      body: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context);
}
