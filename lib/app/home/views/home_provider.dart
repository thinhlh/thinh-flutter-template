import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:tfc/app/home/domain/services/home_service.dart';
import 'package:tfc/base/presentation/providers/loading_provider.dart';
import 'package:tfc/generated/locale_keys.g.dart';
import 'package:tfc/services/rest_api/models/base_response.dart';

class HomeProvider extends LoadingProvider {
  final HomeService _homeService;

  HomeProvider(this._homeService);
  String title = tr(LocaleKeys.general);

  Future<BaseResponse<String>> checkConnection() async {
    final response = await _homeService.checkConnection();

    title = response.data ?? "";
    notifyListeners();

    return response;
  }
}
