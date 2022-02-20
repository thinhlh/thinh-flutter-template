import 'dart:convert';

import 'package:tfc/app/home/data/models/home_connection_model.dart';
import 'package:tfc/base/data/models/response_model.dart';
import 'package:tfc/core/env/app_config.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<HomeConnectionModel> checkConnection();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<HomeConnectionModel> checkConnection() async {
    final result =
        await http.get(Uri.parse(AppConfig.instance.env.baseUrl + '/ping'));

    final responseModel =
        ResponseModel<String>.fromJson(json.decode(result.body)).data;

    return HomeConnectionModel.fromRawData(responseModel);
  }
}
