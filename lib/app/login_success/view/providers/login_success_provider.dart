import 'package:tfc/app/login_success/domain/services/login_success_service.dart';
import 'package:tfc/base/presentation/providers/base_provider.dart';
import 'package:tfc/services/rest_api/models/base_response.dart';

class LoginSuccessProvider extends BaseProvider {
  final LoginSuccessService _loginSuccessService;

  LoginSuccessProvider(this._loginSuccessService);

  Future<BaseResponse> logout() async {
    return await _loginSuccessService.logout();
  }
}
