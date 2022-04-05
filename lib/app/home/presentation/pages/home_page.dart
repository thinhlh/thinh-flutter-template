import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/w_error_dialog.dart';
import 'package:tfc/app/home/presentation/provider/home_provider.dart';
import 'package:tfc/base/presentation/pages/p_loading_stateless.dart';

class HomePage extends PageLoadingStateless<HomeProvider> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        provider.showLoading(true);
        await provider.checkConnection();
        provider.showLoading(false);
        provider.showDialog(
          context,
          WErrorDialog(
            dialogType: DialogType.success,
            content: '',
            onActionProceed: () {},
          ),
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

  @override
  void initialization(BuildContext context) {}
}
