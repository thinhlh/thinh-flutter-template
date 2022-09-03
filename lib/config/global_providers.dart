import 'package:provider/provider.dart';
import 'package:tfc/services/dialogs/app_dialog.dart';
import 'package:tfc/services/dialogs/app_loading.dart';

class GlobalProviders {
  GlobalProviders._internal();

  static List<Provider> get providers => [
        Provider<AppDialog>(create: (_) => AppDialog()),
        Provider<AppLoading>(create: (_) => AppLoading()),
      ];
}
