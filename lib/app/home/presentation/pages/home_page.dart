import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfc/app/home/presentation/provider/home_provider.dart';
import 'package:tfc/base/presentation/pages/p_loading.dart';
import 'package:tfc/generated/locale_keys.g.dart';

class HomePage extends LoadingPage<HomeProvider> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        provider.showDialog(
          context,
          const AlertDialog(
            content: Text('This is a dialog.'),
          ),
        );

        await Future.delayed(const Duration(seconds: 2));

        provider.dismissDialog(context, result: 'OK');
      },
      child: Center(
        child: Text(
          tr(LocaleKeys.general),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
