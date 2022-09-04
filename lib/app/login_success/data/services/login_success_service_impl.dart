import 'package:tfc/app/login_success/domain/services/login_success_service.dart';
import 'package:tfc/services/rest_api/api/api.dart';
import 'package:tfc/services/rest_api/models/base_response.dart';

class LoginSuccessServiceImpl with Api implements LoginSuccessService {
  @override
  Future<BaseResponse> logout() async {
    return BaseResponse.success(true);
  }
}
