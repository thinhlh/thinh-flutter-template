import 'package:easy_localization/easy_localization.dart';
import 'package:tfc/app/home/domain/usecases/check_connection_usecase.dart';
import 'package:tfc/base/domain/usecase/params.dart';
import 'package:tfc/base/presentation/providers/loading_provider.dart';
import 'package:tfc/generated/locale_keys.g.dart';

class HomeProvider extends LoadingProvider {
  final CheckConnectionUseCase _checkConnectionUseCase;

  HomeProvider(this._checkConnectionUseCase);

  String title = tr(LocaleKeys.general);

  Future<void> checkConnection() async {
    final result = await _checkConnectionUseCase.call(NoParams());
    title = result.fold((l) => l.message, (r) => r.message);
  }
}
