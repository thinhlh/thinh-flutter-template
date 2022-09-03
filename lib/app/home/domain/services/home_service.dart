import 'package:tfc/services/rest_api/models/base_response.dart';

abstract class HomeService {
  Future<BaseResponse<String>> checkConnection();
  Future<BaseResponse<String>> checkConnectionFailed();
}
