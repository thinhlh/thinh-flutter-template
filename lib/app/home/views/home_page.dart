import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/home/views/home_provider.dart';
import 'package:tfc/base/presentation/pages/p_stateless.dart';

class HomePage extends PageStateless<HomeProvider> {
  const HomePage({super.key});

  @override
  Widget buildPage(
    BuildContext context,
    HomeProvider provider,
  ) {
    return GestureDetector(
      onTap: () async {
        apiCallSafety(
          provider.checkConnection,
          onStart: () async => showLoading(context, true),
          onCompleted: () async => showLoading(context, false),
        );
      },
      child: Center(
        child: Selector<HomeProvider, String>(
          selector: (_, provider) => provider.title,
          builder: (_, value, child) => Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
