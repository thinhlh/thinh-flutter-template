import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tfc/app/home/data/services/home_service_impl.dart';
import 'package:tfc/app/home/domain/services/home_service.dart';
import 'package:tfc/app/login_success/data/services/login_success_service_impl.dart';
import 'package:tfc/app/login_success/domain/services/login_success_service.dart';
import 'package:tfc/services/dialogs/app_dialog.dart';
import 'package:tfc/services/dialogs/app_loading.dart';

class GlobalProviders {
  GlobalProviders._internal();

  static List<SingleChildWidget> get providers => [
        // Dialogs
        Provider<AppDialog>(create: (_) => AppDialog()),
        Provider<AppLoading>(create: (_) => AppLoading()),

        // Services
        Provider<HomeService>(create: (_) => HomeServiceImpl()),
        Provider<LoginSuccessService>(create: (_) => LoginSuccessServiceImpl()),
      ];
}
